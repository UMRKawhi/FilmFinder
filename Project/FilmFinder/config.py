import os

# database type + protocol, this file just shows the config setting of the database
# don't need to change anything
# SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@127.0.0.1:3306/film'
SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:FilmFinder123,.@18.220.148.52/film"
SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = 'b1b7ed6af47d4031acbdeb420658ba84'
UP_DIR = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/media/')
USER_IMAGE = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/user/')
