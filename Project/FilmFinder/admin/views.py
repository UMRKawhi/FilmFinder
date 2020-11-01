from . import admin
from flask import render_template, redirect, url_for, flash, session, request, abort
from .forms import LoginFrom, GenreForm, FilmForm, DirectorForm, BlackForm
from FilmFinder.models import Admin, Genre, Film, User, Comment, WishList, Director, Direct, GenreTag, BlackList
from functools import wraps
from FilmFinder import app, db
from werkzeug.utils import secure_filename
import os
import uuid
import datetime


def admin_login_require(func):
    @wraps(func)
    def decorated_function(*args, **kwargs):
        if session.get('login_admin', None) is None:
            return redirect(url_for('admin.login', next=request.url))
        return func(*args, **kwargs)

    return decorated_function


def change_filename(filename):
    fileinfo = os.path.splitext(filename)
    filename = datetime.datetime.now().strftime("%Y%m%d%H%M%S") + str(uuid.uuid4().hex + fileinfo[-1])
    return filename


@admin.route("/")
@admin_login_require
def index():
    return render_template('admin/index.html')


@admin.route("/login/", methods=['GET', 'POST'])
def login():
    form = LoginFrom()
    if form.validate_on_submit():
        data = form.data
        login_admin = Admin.query.filter_by(name=data['account']).first()
        if not login_admin.check_pwd(data['password']):
            flash('password error！')
            return redirect(url_for('admin.login'))
        session['login_admin'] = data['account']
        return redirect(request.args.get('next') or url_for('admin.index'))
    return render_template('admin/login.html', form=form)


@admin.route("/logout/")
@admin_login_require
def logout():
    session.pop('login_admin', None)
    return redirect(url_for("admin.login"))


@admin.route("/Genre/add/", methods=['GET', 'POST'])
@admin_login_require
def genre_add():
    form = GenreForm()
    if form.validate_on_submit():
        data = form.data
        tag_num = Genre.query.filter_by(name=data['name']).count()
        if tag_num == 1:
            flash('Genre is already existing！', category='err')
            return redirect(url_for('admin.tag_add'))
        genre = Genre(
            name=data['name']
        )
        print("get")
        db.session.add(genre)
        db.session.commit()
        print("commit")
        flash('add successfully！', category='ok')
        return redirect(url_for('admin.genre_add'))
    return render_template('admin/genre_add.html', form=form)


@admin.route("/genre/list/<int:page>/", methods=['GET'])
@admin_login_require
def genre_list(page=None):
    if page is None:
        page = 1
    page_genres = Genre.query.order_by(Genre.create_time.desc()).paginate(page=page, per_page=10)
    return render_template('admin/genre_list.html', page_genres=page_genres)


@admin.route("/genre/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def genre_delete(delete_id=None):
    if delete_id:
        genre = Genre.query.filter_by(id=delete_id).first_or_404()
        db.session.delete(genre)
        db.session.commit()
        flash('delete successfully！', category='ok')
    return redirect(url_for('admin.genre_list', page=1))


@admin.route("/blacklist/add/", methods=['GET', 'POST'])
@admin_login_require
def blacklist_add():
    form = BlackForm()
    if form.validate_on_submit():
        data = form.data
        black_num = BlackList.query.filter_by(user_id=data['user_id']).count()
        if black_num == 1:
            flash('blacklist is already existing！', category='err')
            return redirect(url_for('admin.blacklist_add'))
        blacklist = BlackList(
            user_id=data['user_id']
        )
        db.session.add(blacklist)
        db.session.commit()
        flash('add successfully！', category='ok')
        return redirect(url_for('admin.blacklist_add'))
    return render_template('admin/blacklist_add.html', form=form)


@admin.route("/blacklist/list/<int:page>/", methods=['GET'])
@admin_login_require
def blacklist_list(page=None):
    if page is None:
        page = 1
    page_blacklists = BlackList.query.order_by(BlackList.create_time.desc()).paginate(page=page, per_page=10)
    return render_template('admin/blacklist_list.html', page_blacklists=page_blacklists)


@admin.route("/blacklist/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def blacklist_delete(delete_id=None):
    if delete_id:
        blacklist = BlackList.query.filter_by(id=delete_id).first_or_404()
        db.session.delete(blacklist)
        db.session.commit()
        flash('delete successfully！', category='ok')
    return redirect(url_for('admin.blacklist_list', page=1))


@admin.route("/director/add/", methods=['GET', 'POST'])
@admin_login_require
def director_add():
    form = DirectorForm()
    if form.validate_on_submit():
        data = form.data
        director_num = Director.query.filter_by(name=data['name']).count()
        if director_num == 1:
            flash('Genre is already existing！', category='err')
            return redirect(url_for('admin.director_add'))
        director = Director(
            name=data['name']
        )
        db.session.add(director)
        db.session.commit()
        flash('add successfully！', category='ok')
        return redirect(url_for('admin.director_add'))
    return render_template('admin/director_add.html', form=form)


@admin.route("/director/list/<int:page>/", methods=['GET'])
@admin_login_require
def director_list(page=None):
    if page is None:
        page = 1
    page_directors = Director.query.order_by(Director.create_time.desc()).paginate(page=page, per_page=10)
    return render_template('admin/director_list.html', page_directors=page_directors)


@admin.route("/director/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def director_delete(delete_id=None):
    if delete_id:
        director = Director.query.filter_by(id=delete_id).first_or_404()
        db.session.delete(director)
        db.session.commit()
        flash('delete successfully！', category='ok')
    return redirect(url_for('admin.director_list', page=1))


@admin.route("/film/add/", methods=['GET', 'POST'])
@admin_login_require
def film_add():
    form = FilmForm()
    if form.validate_on_submit():
        data = form.data

        if Film.query.filter_by(name=data['name']).count() == 1:
            flash('Film already exists', category='err')
            return redirect(url_for('admin.film_add'))

        file_logo = secure_filename(form.logo.data.filename)
        file_save_path = app.config['UP_DIR']  #
        if not os.path.exists(file_save_path):
            os.makedirs(file_save_path)
            import stat
            os.chmod(file_save_path, stat.S_IRWXU)
        logo = change_filename(file_logo)
        form.logo.data.save(file_save_path + logo)
        print(data)
        genre = GenreTag(genre_id=data['genre_id'])
        direct = Direct(director_id=data['director_id'])
        print(genre, direct)
        film = Film(
            name=data['name'],
            description=data['description'],
            logo=logo,
            star=data['star'],
            play_num=0,
            comment_num=0,
            genre=[genre],
            director=[direct],
            release_time=data['release_time'],
            release_length=data['release_length']
        )
        print("success")
        db.session.add(film)
        db.session.commit()
        flash('add successfully', 'ok')
        return redirect(url_for('admin.film_add'))
    return render_template('admin/film_add.html', form=form)


@admin.route("/film/list/<int:page>/", methods=['GET'])
@admin_login_require
def film_list(page=None):
    if page is None:
        page = 1

    page_films = Film.query.join(GenreTag).filter(GenreTag.film_id==Film.id).join(Genre).filter(GenreTag.genre_id==Genre.id).order_by(
        Film.create_time.desc()
    ).paginate(page=page, per_page=10)
    print(Film.query.join(GenreTag).filter(GenreTag.film_id==Film.id).join(Genre).filter(GenreTag.genre_id==Genre.id).order_by(
        Film.create_time.desc()
    ))
    return render_template('admin/film_list.html', page_films=page_films)


@admin.route("/film/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def film_delete(delete_id=None):
    if delete_id:
        film = Film.query.filter_by(id=delete_id).first_or_404()
        print(film.logo)
        file_save_path = app.config['UP_DIR']

        if os.path.exists(os.path.join(file_save_path, film.logo)):
            os.remove(os.path.join(file_save_path, film.logo))

        db.session.delete(film)
        db.session.commit()
        flash('delete successfully！', category='ok')
    return redirect(url_for('admin.film_list', page=1))


@admin.route("/comment/list/<int:page>/")
@admin_login_require
def comment_list(page=None):
    if page is None:
        page = 1
    page_comments = Comment.query.join(
        Film
    ).join(
        User
    ).filter(
        Film.id == Comment.film_id,
        User.id == Comment.user_id
    ).order_by(
        Comment.add_time.desc()
    ).paginate(page=page, per_page=10)
    return render_template('admin/comment_list.html', page_comments=page_comments)


@admin.route("/comment/delete/<int:delete_id>")
@admin_login_require
def comment_delete(delete_id=None):
    comment = Comment.query.get_or_404(delete_id)
    db.session.delete(comment)
    db.session.commit()
    flash('delete successfully！', category='ok')
    return redirect(url_for('admin.comment_list', page=1))
