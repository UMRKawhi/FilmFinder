#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @Time   : 2020/10/1 12:45


# define blueprint of manage function
from flask import Blueprint
admin = Blueprint("admin", "admin", url_prefix="/admin")

from FilmFinder.admin import views

