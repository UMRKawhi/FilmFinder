from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from .admin import admin as admin_blueprint
from .home import home as home_blueprint
import os


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config['SQLALCHEMY_DATABASE_URI'] = "ysql+pymysql://root:root@127.0.0.1:3306/film"
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True
    app.config['SECRET_KEY'] = '1234567890'
    app.config['UP_DIR'] = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/media/')
    app.config['USER_IMAGE'] = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/user/')
    app.register_blueprint(admin_blueprint)
    app.register_blueprint(home_blueprint)

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    return app

app = create_app()
db = SQLAlchemy(app)