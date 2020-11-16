# define blueprint of admin function
from flask import Blueprint
admin = Blueprint("admin", "admin", url_prefix="/admin")

from FilmFinder.admin import views

