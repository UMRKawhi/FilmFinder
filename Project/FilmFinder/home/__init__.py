# define blueprint of home function
from flask import Blueprint
home = Blueprint("home", __name__)

from FilmFinder.home import views
