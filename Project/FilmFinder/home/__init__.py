# define blueprint of main website
from flask import Blueprint
home = Blueprint("home", __name__)

from FilmFinder.home import views
