from flask import render_template

from . import home

@home.route("/")
def index():
    return render_template('home/index.html')

@home.route("/register/")
def register():
    return render_template('home/register.html')

@home.route("/user/")
def user():
    return render_template('home/user.html')

@home.route("/password/")
def password():
    return render_template('home/password.html')

@home.route("/comments/")
def comments():
    return render_template('home/comments.html')

@home.route("/userlog/")
def userlog():
    return render_template("home/userlog.html")

@home.route("/wishlist/")
def wishlist():
    return render_template("home/wishlist.html")

@home.route("/login/")
def login():
    return render_template("home/login.html")

@home.route("/search")
def search():
    return render_template("home/search.html")

@home.route("/detail/")
def detail():
    return  render_template("home/detail.html")
