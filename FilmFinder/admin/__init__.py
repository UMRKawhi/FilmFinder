# define blueprint of manage function
from flask import Blueprint
admin = Blueprint("admin", "admin", url_prefix="/admin")

from . import views

