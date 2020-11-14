import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy


# create and configure the app
app = Flask(__name__, instance_relative_config=True)
app.debug = True
# local host
# app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:root@127.0.0.1:3306/film"
# google cloud database
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:FilmFinder123,.@34.87.235.63:3306/film"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SECRET_KEY'] = 'b1b7ed6af47d4031acbdeb420658ba84'
app.config['UP_DIR'] = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/media/')
app.config['USER_IMAGE'] = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/user/')


db = SQLAlchemy(app)

from FilmFinder.admin import admin as admin_blueprint
from FilmFinder.home import home as home_blueprint

app.register_blueprint(admin_blueprint)
app.register_blueprint(home_blueprint)
