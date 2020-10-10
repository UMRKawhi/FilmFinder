# define blueprint of manage function
from flask import Blueprint
from . import views
admin = Blueprint("admin", "admin", url_prefix="/admin")
