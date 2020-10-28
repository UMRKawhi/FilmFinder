from sqlalchemy.sql import func
from . import home
from flask import render_template, redirect, url_for, flash, session, request,g
from .forms import RegisterForm, LoginFrom, UserDetailForm, CommentForm
from FilmFinder.models import User, UserLog, Film, WishList, Comment, Genre, BlackList, GenreTag, Director, Cast, Direct
from werkzeug.security import generate_password_hash
from werkzeug.utils import secure_filename
import os
from FilmFinder import db, app
import uuid
from functools import wraps


def user_login_require(func):
    @wraps(func)
    def decorated_function(*args, **kwargs):
        if session.get('login_user', None) is None:
            return redirect(url_for('home.login', next=request.url))
        return func(*args, **kwargs)

    return decorated_function

@home.route("/")
def index():
    login_user = session.get('login_user')
    login_user_id = session.get('login_user_id')
    user={
        'login_user':login_user,
        'login_user_id':login_user_id
    }
    return render_template("home/index.html", user=user)


@home.route("/<int:page>/")
def index2(page):
    if not page:
        page = 1
    all_tag = Genre.query.all()
    star_list = [(1, '1 star'), (2, '2 star'), (3, '3 star'), (4, '4 star'), (5, '5 star')]
    all_star = map(lambda x: {'num': x[0], 'info': x[1]}, star_list)
    import time
    now_year = time.localtime()[0]
    year_range = [year for year in range(int(now_year) - 1, int(now_year) - 5, -1)]
    page_movies = Film.query
    selected = dict()
    genre_id = request.args.get('genre_id', 0)
    if int(genre_id) != 0:
        page_movies = page_movies.filter_by(tag_id=genre_id)
    selected['genre_id'] = genre_id

    star_num = request.args.get('star_num', 0)
    if int(star_num) != 0:
        page_movies = page_movies.filter_by(star=star_num)
    selected['star_num'] = int(star_num)

    time_year = request.args.get('time_year', 1)
    from sqlalchemy import extract, exists, between
    if int(time_year) == 0:
        page_movies = page_movies
    elif int(time_year) == 1:
        page_movies = page_movies
    else:
        page_movies = page_movies.filter(extract('year', Film.release_time) == time_year)
    selected['time_year'] = time_year

    play_num = request.args.get('play_num', 1)
    if int(play_num) == 1:
        page_movies = page_movies.order_by(
            Film.play_num.desc()
        )
    else:
        page_movies = page_movies.order_by(Film.play_num.asc())
    selected['play_num'] = play_num

    comment_num = request.args.get('comment_num', 1)  # 1为从高到低，0为从低到好
    if int(comment_num) == 1:
        page_movies = page_movies.order_by(
            Film.comment_num.desc()
        )
    else:
        page_movies = page_movies.order_by(Film.comment_num.asc())
    selected['comment_num'] = comment_num

    page_movies = page_movies.paginate(page=page, per_page=12)
    return render_template('home/index.html',
                           all_tag=all_tag,
                           all_star=all_star,
                           now_year=now_year,
                           year_range=year_range,
                           selected=selected,
                           page_movies=page_movies)

@home.route('/login/', methods=['GET', 'POST'])
def login():
    form = LoginFrom()
    if form.validate_on_submit():
        data = form.data
        user = User.query.filter_by(name=data['name']).first()
        if not user.check_password(data['password']):
            flash('password error', category='err')
            return redirect(url_for('home.login'))
        session['login_user'] = user.name
        session['login_user_id'] = user.id
        userlog = UserLog(
            user_id=user.id,
            ip=request.remote_addr
        )
        db.session.add(userlog)
        db.session.commit()
        return redirect(url_for('home.user'))
    return render_template('home/login.html', form=form)


@home.route('/logout/')
def logout():
    session.pop('login_user', None)
    session.pop('login_user_id', None)
    return redirect(url_for('home.login'))


@home.route('/register/', methods=['GET', 'POST'])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        data = form.data
        user = User(
            name=data['name'],
            first_name=data['first_name'],
            second_name=data['second_name'],
            password=generate_password_hash(data['password']),
            email=data['email'],
            phone=data['phone'],
        )
        db.session.add(user)
        db.session.commit()
        flash('register successful', category='ok')
        return redirect(url_for('home.login'))
    return render_template('home/register.html', form=form)


@home.route('/user/', methods=['GET', 'POST'])
@user_login_require
def user():
    login_user = User.query.get_or_404(int(session['login_user_id']))
    form = UserDetailForm(
        name=login_user.name,
        email=login_user.email,
        phone=login_user.phone,
    )
    form.face.validators = []
    form.face.render_kw = {'required': False}
    if form.validate_on_submit():
        data = form.data
        face_save_path = app.config['USER_IMAGE']
        if not os.path.exists(face_save_path):
            os.makedirs(face_save_path)
            import stat
            os.chmod(face_save_path, stat.S_IRWXU)

        if form.face.data:
            if login_user.face and os.path.exists(os.path.join(face_save_path, login_user.face)):
                os.remove(os.path.join(face_save_path, login_user.face))

            file_face = secure_filename(form.face.data.filename)
            from ..admin.views import change_filename
            login_user.face = change_filename(file_face)
            form.face.data.save(face_save_path + login_user.face)

        if login_user.name != data['name'] and User.query.filter_by(name=data['name']).count() == 1:
            flash('nick name exists', 'err')
            return redirect(url_for('home.user'))
        login_user.name = data['name']

        if login_user.email != data['email'] and User.query.filter_by(email=data['email']).count() == 1:
            flash('email exists', 'err')
            return redirect(url_for('home.user'))
        login_user.email = data['email']

        if login_user.phone != data['phone'] and User.query.filter_by(phone=data['phone']).count() == 1:
            flash('phone exists', 'err')
            return redirect(url_for('home.user'))
        login_user.phone = data['phone']


        db.session.commit()
        flash('modify successfully', 'ok')
        return redirect(url_for('home.user'))
    return render_template('home/user.html', form=form, login_user=login_user)



@home.route('/comments/<int:page>/')
@user_login_require
def comments(page):
    if not page:
        page = 1
    page_comments = Comment.query.filter_by(
        user_id=int(session['login_user_id'])
    ).order_by(
        Comment.create_time.desc()
    ).paginate(page=page, per_page=10)
    return render_template('home/comments.html', page_comments=page_comments)




@home.route('/wishlist/<int:page>/')
@user_login_require
def wishlist(page):
    if not page:
        page = 1

    wishlists = WishList.query.filter_by(
        user_id=int(session['login_user_id'])
    ).all()
    wishs = []
    for wish in wishlists:
        wishs.append(wish.film_id)
    page_wishlists = Film.query.join(WishList).filter(
        Film.id.in_(wishs)
    ).paginate(page=page, per_page=10)
    return render_template('home/wishlist.html', page_wishlists=page_wishlists)

@home.route('/wishlist/watch/<int:user_id>/<int:page>')
def watch_wishlist(user_id=None, page=None):
    if not page:
        page = 1
    wishlists = WishList.query.filter(WishList.user_id == user_id).all()
    wishs = []
    for wish in wishlists:
        wishs.append(wish.film_id)

    page_wishlists = Film.query.join(WishList).filter(
        Film.id.in_(wishs)
    ).paginate(page=page, per_page=10)
    return render_template('home/watch_wishlist.html', page_wishlists=page_wishlists, user_id=user_id, page=page)


@home.route("/wishlist/delete/<int:delete_id>")
@user_login_require
def wishlist_delete(delete_id=None):
    user_id = session['login_user_id']
    wishlist = WishList.query.filter(WishList.film_id==delete_id, WishList.user_id==int(user_id)).first_or_404()
    db.session.delete(wishlist)
    db.session.commit()
    flash('delete success！', category='ok')
    return redirect(url_for('home.wishlist', page=1))

@home.route("/comments/delete/<int:delete_id>")
@user_login_require
def comments_delete(delete_id=None):
    user_id = session['login_user_id']
    wishlist = Comment.query.filter(Comment.id==delete_id, Comment.user_id==user_id).first_or_404()
    db.session.delete(wishlist)
    db.session.commit()
    flash('delete success！', category='ok')
    return redirect(url_for('home.comments', page=1))


@home.route('/blacklist/<int:page>/')
@user_login_require
def blacklist(page):
    if not page:
        page = 1
    blacklists = BlackList.query.filter_by(
        user_id=int(session['login_user_id'])
    ).all()
    banners = []
    for black in blacklists:
        banners.append(black.banner_id)
    page_blacklists = User.query.filter(
        User.id.in_(banners)
    ).paginate(page=page, per_page=10)
    print(page_blacklists)
    return render_template('home/blacklist.html', page_blacklists=page_blacklists)


@home.route('/search/')
def search():
    keyword = request.args.get('keyword')
    data_type = request.args.get('type')
    search_films = Film.query.filter(
        Film.name.ilike("%" + keyword + "%"),
    ).order_by(
        Film.star.desc(),
        Film.name.desc()
    )
    search_count = Film.query.filter(Film.name.ilike("%" + keyword + "%")).count()
    if data_type == 'description':
        search_films = Film.query.filter(
            Film.description.ilike("%" + keyword + "%")
        ).order_by(
            Film.star.desc(),
            Film.name.desc()
        )
        search_count = search_films.count()
    if data_type == 'genre':
        search_films = Film.query.join(GenreTag).join(Genre).filter(
            Film.id ==GenreTag.film_id,
            GenreTag.genre_id == Genre.id,
            Genre.name.ilike("%" + keyword + "%")
        ).order_by(
            Film.star.desc(),
            Film.name.desc()
        )
        search_count = search_films.count()
    if data_type =='director':
        search_films = Film.query.join(Direct).join(Director).filter(
            Film.id == Direct.film_id,
            Direct.director_id == Director.id,
            Director.name.ilike("%" + keyword + "%")
        ).order_by(
            Film.star.desc(),
            Film.name.desc()
        )
        search_count = search_films.count()
    return render_template('home/search.html', keyword=keyword, search_films=search_films, search_count=search_count)


@home.route('/detail/<int:id>/<int:page>', methods=['GET', 'POST'])
def detail(id=None,page=None):
    recommendation = request.args.get('recommendation')
    film = Film.query.join(GenreTag).join(Genre).filter(
        Genre.id == GenreTag.genre_id,
        GenreTag.film_id==Film.id,
        Film.id == int(id)
    ).first_or_404()
    genres = []
    for g in film.genre:
        genre = Genre.query.filter(Genre.id == g.genre_id).first_or_404()
        genres.append(genre)
    directors=[]
    for d in film.director:
        director = Director.query.filter(Director.id == d.director_id).first_or_404()
        directors.append(director)
    casts = []
    for p in film.performance:
        cast = Cast.query.filter(Cast.id == p.cast_id).first_or_404()
        casts.append(cast)
    if request.method == 'GET' and int(request.args.get('page', 0)) != 1:
        film.play_num += 1
        db.session.commit()

    form = CommentForm()
    if 'login_user' not in session:
        form.submit.render_kw = {
            'disabled': "disabled",
            "class": "btn btn-success",
            "id": "btn-sub"
        }

    page_recommendations = Film.query.order_by(
        Film.star.desc()
    ).paginate(page=page, per_page=10)
    last_film_id = None

    page_comments = Comment.query.filter(
                Comment.film_id == id
            ).order_by(
                Comment.create_time.desc()
            ).paginate(page=page, per_page=10)
    if 'login_user' in session:
        user_id = session['login_user_id']
        blacklists = BlackList.query.filter(Comment.user_id == user_id).all()
        banners = []
        for black in blacklists:
            banners.append(black.user_id)
        page_comments = Comment.query.join(
                    Film
                ).join(
                    User
                ).filter(
                    Film.id == film.id,
                    User.id == Comment.user_id,
                    User.id.notin_(banners)
                ).order_by(
                    Comment.create_time.desc()
                ).paginate(page=page, per_page=10)
        temp_comments = Comment.query.join(
            Film
        ).join(
            User
        ).filter(
            Film.id == film.id,
            User.id == Comment.user_id,
            User.id.notin_(banners)
        ).all()
        score = 0
        num = 0
        for temp in temp_comments:
            score = score + temp.score
            num = num + 1
        if num == 0:
            film.star = 0
        else:
            film.star = score / num

        comment_history = Comment.query.filter(Comment.user_id == user_id).order_by(Comment.score.desc(), Comment.create_time.desc()).limit(10).all()
        if comment_history:
            score_greater = []
            score_middle = []
            for comment in comment_history:
                if comment.score >= 4:
                    score_greater.append(comment.film_id)
                if comment.score == 3:
                    score_middle.append(comment.film_id)
            common_films = Film.query.filter(Film.id.in_(score_greater)).all()
            print(common_films)
            if recommendation == 'genre':
                genre_list = []
                for cf in common_films:
                    for g in cf.genre:
                        genre_list.append(g.genre_id)
                genre_list.extend([g.genre_id for g in film.genre])
                page_recommendations = Film.query.join(GenreTag).filter(
                    Film.id == GenreTag.film_id,
                    GenreTag.genre_id.in_(genre_list)
                    ).order_by(
                    Film.star.desc()
                ).paginate(page=page, per_page=10)
            if recommendation == 'director':
                director_list = []
                for cf in common_films:
                    for d in cf.director:
                        director_list.append(d.director_id)
                director_list.extend([d.director_id for d in film.director])
                page_recommendations = Film.query.join(Direct).filter(
                    Film.id == Direct.film_id,
                    Direct.director_id.in_(director_list)
                ).order_by(
                    Film.star.desc()
                ).paginate(page=page, per_page=10)
        ip = request.remote_addr
        userlog = UserLog(user_id=user_id,ip=ip,film_id=id)
        db.session.add(userlog)
        db.session.commit()

    if form.validate_on_submit() and 'login_user' in session:
        data = form.data
        comment = Comment(
            content=data['content'],
            film_id=film.id,
            score=data['star'],
            user_id=session['login_user_id']
        )
        ratings = Comment.query.filter(Comment.film_id == film.id).all()
        num = 1
        sum = data['star']
        for rate in ratings:
            num = num + 1
            sum += rate.score
        film.star = sum / num
        db.session.add(comment)
        film.comment_num += 1
        db.session.commit()
        flash('comment successfully', category='ok')
        return redirect(url_for('home.detail', id=film.id, page=1))

    if page is None:
        page = 1

    print("success")

    return render_template('home/detail.html', film=film,genres=genres, directors=directors, casts=casts, form=form, page_comments=page_comments, page_recommendations=page_recommendations, last_film_id=last_film_id)


@home.route('/wishlist/add/')
@user_login_require
def add_wishlist():
    film_id = request.args.get('film_id', '')
    user_id = request.args.get('user_id', '')
    wishlist = WishList.query.filter_by(
        user_id=int(user_id),
        film_id=int(film_id)
    )
    if wishlist.count() == 1:
        data = dict(ok=0)
    if wishlist.count() == 0:
        wishlist = WishList(
            user_id=int(user_id),
            film_id=int(film_id)
        )
        db.session.add(wishlist)
        db.session.commit()
        data = dict(ok=1)
    import json
    return json.dumps(data)

@home.route('/banner/add/<int:film_id>/<int:banner_id>')
@user_login_require
def add_banner(banner_id=None, film_id=None):
    if banner_id:
        user_id = session.get('login_user_id')
        blacklist = BlackList(
            user_id=user_id,
            banner_id = banner_id
        )
        db.session.add(blacklist)
        db.session.commit()
        return redirect(url_for('home.detail', id=film_id, page = 1) )
    return redirect(url_for('home.detail', id=film_id, page = 1))

@home.route("/banner/delete/<int:banner_id>/")
@user_login_require
def delete_banner(banner_id=None):
    user_id = session.get('login_user_id')
    banner = BlackList.query.filter(
        user_id==int(user_id),
        banner_id == banner_id
    ).first_or_404()
    db.session.delete(banner)
    db.session.commit()

    return redirect(url_for('home.blacklist', page=1))



