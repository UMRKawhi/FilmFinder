#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @Time   : 2020/10/1 12:47

# define blueprint of home function



from flask import Blueprint

home = Blueprint("home", __name__)

from FilmFinder.home import views