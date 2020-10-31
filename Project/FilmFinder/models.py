import datetime
from . import db

class User(db.Model):
    __tablename__ = 'user'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # nick name
    name = db.Column(db.String(11), unique=True, nullable=True)
    # first name
    first_name = db.Column(db.String(20))
    # second name
    second_name = db.Column(db.String(20))
    # password
    password = db.Column(db.String(255), nullable=False)
    # email
    email = db.Column(db.String(100), unique=True)
    # phone
    phone = db.Column(db.String(20), unique=True)
    # face
    face = db.Column(db.String(255), unique=True)
    # register time
    register_time = db.Column(db.DateTime, default=datetime.datetime.now)
    # foregin constraints
    userlogs = db.relationship('UserLog', backref='user')
    # comment constraints
    comments = db.relationship('Comment', backref='user')
    # wishlist constraints
    wishlist = db.relationship('WishList', backref='user')
    # blacklist
    blacklist = db.relationship('BlackList', backref='user')
    # check password
    def check_password(self, password):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.password, password)
    # format output
    def __str__(self):
        return "<User %r>" % self.first_name + " " + self.second_name

    # format output
    def __repr__(self):
        return "<User %r>" % self.first_name + " " + self.second_name


class UserLog(db.Model):
    __tablename__ = 'userlog'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # user id
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    # the ip address of login
    ip = db.Column(db.String(100))
    # film id
    film_id = db.Column(db.Integer)
    # log time
    log_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)


class Genre(db.Model):
    __tablename__ = 'genre'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # genre
    name = db.Column(db.String(100), unique=True)
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)
    # foreign constraint of Film
    film = db.relationship('GenreTag', backref='genre')

    # format output
    def __str__(self):
        return "<Genre %r>" % self.name

    def __repr__(self):
        return "<Genre %r>" % self.name


class Director(db.Model):
    __tablename__ = 'director'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # name
    name = db.Column(db.String(100), nullable=False)
    # first name
    first_name = db.Column(db.String(20))
    # second name
    second_name = db.Column(db.String(20))
    # email
    email = db.Column(db.String(100))
    # phone
    phone = db.Column(db.String(20))
    # face
    face = db.Column(db.String(255))
    # foreign constraint of Film
    film = db.relationship('Direct', backref='director')

    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<Director %r>" % self.name

    # format output
    def __repr__(self):
        return "<Director %r>" % self.name


class Cast(db.Model):
    __tablename__ = 'cast'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # name
    name = db.Column(db.String(20), unique=True)
    # first name
    first_name = db.Column(db.String(20))
    # second name
    second_name = db.Column(db.String(20))
    # email
    email = db.Column(db.String(100))
    # phone
    phone = db.Column(db.String(20))
    # face
    face = db.Column(db.String(255))
    # works
    performance = db.relationship('Performance', backref='cast')

    # format output
    def __str__(self):
        return "<Cast %r>" % self.first_name + " " + self.second_name

    # format output
    def __repr__(self):
        return "<Cast %r>" % self.first_name + " " + self.second_name


class Film(db.Model):
    __tablename__ = 'film'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # name
    name = db.Column(db.String(255), unique=True)
    # description
    description = db.Column(db.Text)
    # logo
    logo = db.Column(db.String(255), unique=True)
    # average rating
    star = db.Column(db.SmallInteger)
    # play number
    play_num = db.Column(db.BigInteger)
    # comment num
    comment_num = db.Column(db.BigInteger)
    # release time
    release_time = db.Column(db.Date)
    # release length
    release_length = db.Column(db.String(100))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)
    # cast constraint
    performance = db.relationship('Performance', backref='film')
    # director constraint
    director = db.relationship('Direct', backref='film')
    # genre constraint
    genre = db.relationship('GenreTag', backref='film')
    # format output
    def __str__(self):
        return "<Film %r>" % self.name

    def __repr__(self):
        return "<Film %r>" % self.name

class Comment(db.Model):
    __tablename__ = 'comment'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # content
    content = db.Column(db.Text)
    # film id
    film_id = db.Column(db.Integer, db.ForeignKey('film.id'))
    # user id
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)
    # score
    score = db.Column(db.SmallInteger, default=0)

    # format output
    def __str__(self):
        return "<Comment %r>" % self.id

    def __repr__(self):
        return "<Comment %r>" % self.id


class Direct(db.Model):
    __tablename__ = 'direct'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # film id
    film_id = db.Column(db.Integer, db.ForeignKey('film.id'))
    # director id
    director_id = db.Column(db.Integer, db.ForeignKey('director.id'))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<Direct %r>" % self.id

    def __repr__(self):
        return "<Direct %r>" % self.id

class GenreTag(db.Model):
    __tablename__ = 'genretag'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # film id
    film_id = db.Column(db.Integer, db.ForeignKey('film.id'))
    # genre id
    genre_id = db.Column(db.Integer, db.ForeignKey('genre.id'))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<GenreTag %r>" % self.id

    def __repr__(self):
        return "<GenreTag %r>" % self.id


class Performance(db.Model):
    __tablename__ = 'performance'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # film id
    film_id = db.Column(db.Integer, db.ForeignKey('film.id'))
    # director id
    cast_id = db.Column(db.Integer, db.ForeignKey('cast.id'))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<Cast %r>" % self.id

    def __repr__(self):
        return "<Cast %r>" % self.id





class BlackList(db.Model):
    __tablename__ = 'blacklist'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # user id
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    # banner user
    banner_id = db.Column(db.Integer, nullable=False)
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<BlackList %r>" % self.id

    def __repr__(self):
        return "<BlackList %r>" % self.id


class WishList(db.Model):
    __tablename__ = 'wishlist'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # film id
    film_id = db.Column(db.Integer, db.ForeignKey('film.id'))
    # user id
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "<WishList %r>" % self.id

    def __repr__(self):
        return "<WishList %r>" % self.id


class Admin(db.Model):
    __tablename__ = 'admin'
    # id
    id = db.Column(db.Integer, primary_key=True)
    # name
    name = db.Column(db.String(100), unique=True)
    # password
    password = db.Column(db.String(100), nullable=True)
    # admin log
    adminlogs = db.relationship('AdminLog', backref='admin')
    operatelogs = db.relationship('OperateLog', backref='operatelog')

    def check_pwd(self, password):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.password, password)

    def __str__(self):
        return "<Admin %r>" % self.name

    def __repr__(self):
        return "<Admin %r>" % self.name


class AdminLog(db.Model):
    __tablename__ = "adminlog"
    # id
    id = db.Column(db.Integer, primary_key=True)
    # admin id
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id'))
    # ip address
    ip = db.Column(db.String(100))
    # login time
    login_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    def __str__(self):
        return "<Adminlog %r>" % self.id

    def __repr__(self):
        return "<Adminlog %r>" % self.id


class OperateLog(db.Model):
    __tablename__ = "operatelog"
    # id
    id = db.Column(db.Integer, primary_key=True)
    # admin id
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id'))
    # ip address
    ip = db.Column(db.String(100))
    # operation reason
    reason = db.Column(db.String(600))
    # create time
    create_time = db.Column(db.DateTime, index=True, default=datetime.datetime.now)

    # format output
    def __str__(self):
        return "Operatelog %r" % self.id

    def __repr__(self):
        return "Operatelog %r" % self.id


if __name__ == '__main__':
    print(db)
    db.create_all()
