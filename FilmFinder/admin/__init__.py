from flask import Blueprint
from FilmFinder.admin import views

admin = Blueprint("admin", "admin", url_prefix="/admin")



