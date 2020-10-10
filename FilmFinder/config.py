import os

SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@127.0.0.1:3306/film'
SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = '1234567890'
UP_DIR = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/media/')
USER_IMAGE = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/user/')
