from flask import render_template, redirect, url_for

from . import admin


@admin.route("/")
def index():
    return render_template("admin/index.html")

@admin.route("/login/")
def login():
    return render_template('admin/login.html')


@admin.route("/logout/")
def logout():
    return redirect(url_for("admin.login"))

@admin.route("/genre/add/")
def genre_add():
    return render_template('admin/genre.html')


@admin.route("/genre/list/")
def genre_list():
    return render_template('admin/genre_list.html')

@admin.route("/film/add/")
def film_add():
    return render_template('admin/film_add.html')


@admin.route("/film/list/")
def film_list():
    return render_template('admin/film_list.html')

@admin.route("/user/list/")
def user_list():
    return render_template('admin/user_list.html')


@admin.route("/user/view/")
def user_view():
    return render_template('admin/user_view.html')

@admin.route("/comment/list/")
def comment_list():
    return render_template('admin/comment_list.html')

@admin.route("/wish/list/")
def wish_list():
    return render_template('admin/wish_list.html')