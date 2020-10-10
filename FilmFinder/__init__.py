from flask import Flask, render_template
from .admin import admin as admin_blueprint
from .home import home as home_blueprint
from flask_sqlalchemy import SQLAlchemy
import os


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
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

    app.register_blueprint(admin_blueprint)
    app.register_blueprint(home_blueprint)

    return app


app = create_app()
db = SQLAlchemy(app)


# 404 page
@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404


# 401 page
@app.errorhandler(401)
def unauthorized_access(error):
    return render_template('401.html'), 401
