from . import admin
from flask import render_template, redirect, url_for, flash, session, request, abort
from .forms import LoginFrom, GenreForm, FilmForm
from ..models import Admin,Genre,Film,User,Comment,WishList
from functools import wraps
from ..app import db, app
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
def index():
    return render_template('admin/index.html')


@admin.route("/login/", methods=['GET', 'POST'])
def login():
    form = LoginFrom()
    if form.validate_on_submit():
        data = form.data
        print(data)
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
        db.session.add(genre)
        db.session.commit()
        flash('add successfully！', category='ok')
        return redirect(url_for('admin.genre_add'))
    return render_template('admin/genre_add.html', form=form)


@admin.route("/genre/list/<int:page>/", methods=['GET'])
@admin_login_require
def genre_list(page=None):
    if page is None:
        page = 1
    page_genres = Genre.query.order_by(Genre.add_time.desc()).paginate(page=page, per_page=10)
    return render_template('admin/tag_list.html', page_tags=page_genres)


@admin.route("/tag/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def genre_delete(delete_id=None):
    if delete_id:
        tag = Genre.query.filter_by(id=delete_id).first_or_404()
        db.session.delete(tag)
        db.session.commit()
        flash('delete successfully！', category='ok')
    return redirect(url_for('admin.genre_list', page=1))



@admin.route("/film/add/", methods=['GET', 'POST'])
@admin_login_require
def movie_add():
    form = FilmForm()
    if form.validate_on_submit():
        data = form.data

        if Film.query.filter_by(title=data['name']).count() == 1:
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

        film = Film(
            title=data['name'],
            description=data['description'],
            logo=logo,
            star=data['star'],
            play_num=0,
            comment_num=0,
            genre=data['genre_id'],
            release_time=data['release_time'],
            length=data['length']
        )
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

    page_films = Film.query.join(Genre).filter(
        Genre.id == Film.genre
    ).order_by(
        Film.add_time.desc()
    ).paginate(page=page, per_page=10)
    return render_template('admin/film_list.html', page_movies=page_films)


@admin.route("/movie/delete/<int:delete_id>/", methods=['GET'])
@admin_login_require
def movie_delete(delete_id=None):
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



@admin.route("/user/list/<int:page>/")
@admin_login_require
def user_list(page=None):
    if page is None:
        page = 1
    page_users = User.query.paginate(page=page, per_page=10)
    return render_template('admin/user_list.html', page_users=page_users)


@admin.route("/user/view/<int:user_id>/")
@admin_login_require
def user_view(user_id=None):
    user = User.query.get_or_404(user_id)
    return render_template('admin/user_view.html', user=user)


@admin.route("/user/delete/<int:delete_id>/")
@admin_login_require
def user_delete(delete_id=None):
    user = User.query.get_or_404(delete_id)
    file_save_path = app.config['USER_IMAGE']
    if os.path.exists(os.path.join(file_save_path, user.face)):
        os.remove(os.path.join(file_save_path, user.face))
    db.session.delete(user)
    db.session.commit()
    flash('delete successfully！', category='ok')
    return redirect(url_for('admin.user_list', page=1))


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
