from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, SelectField, FileField, SelectMultipleField, \
    DateTimeField,DateField
from wtforms.validators import DataRequired, ValidationError, EqualTo
from FilmFinder.models import Admin, Genre, Director, User


class LoginFrom(FlaskForm):
    account = StringField(
        label='name',
        validators=[
            DataRequired('please input name!')
        ],
        description='name',
        render_kw={
            'class': "form-control",
            'placeholder': "please input name",
            'required': "required"
        }
    )

    password = PasswordField(
        label='password',
        validators=[
            DataRequired('please input password!')
        ],
        description='password',
        render_kw={
            'class': "form-control",
            'placeholder': "please input password",
            'required': "required"
        }
    )
    submit = SubmitField(
        label='login',
        render_kw={
            'class': "btn btn-primary btn-block btn-flat"
        }
    )

    def validate_account(self, field):
        account = field.data
        admin_num = Admin.query.filter_by(name=account).count()
        if admin_num == 0:
            raise ValidationError('account is not existing')


class GenreForm(FlaskForm):
    name = StringField(
        label='genre',
        validators=[
            DataRequired('it can not be empty!')
        ],
        description='genre',
        render_kw={
            'class': "form-control",
            'id': "input_name",
            'placeholder': "please input genre!"
        }
    )
    submit = SubmitField(
        label='submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )
class DirectorForm(FlaskForm):
    name = StringField(
        label='director',
        validators=[
            DataRequired('it can not be empty!')
        ],
        description='director',
        render_kw={
            'class': "form-control",
            'id': "input_name",
            'placeholder': "please input director!"
        }
    )
    submit = SubmitField(
        label='submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )
class BlackForm(FlaskForm):
    user_id = SelectField(
        label='genre',
        validators=[
            DataRequired('please select genre！')
        ],
        coerce=int,
        description='genre',
        render_kw={
            'class': "form-control"
        }
    )

    def __init__(self, *args, **kwargs):
        super(BlackForm, self).__init__(*args, **kwargs)
        self.user_id.choices = [(v.id, v.name) for v in User.query.all()]

    submit = SubmitField(
        label='submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )

class FilmForm(FlaskForm):
    name = StringField(
        label='name',
        validators=[
            DataRequired('please input name!')
        ],
        description='name',
        render_kw={
            'class': "form-control",
            'placeholder': "please input name!"
        }
    )
    description = TextAreaField(
        label='description',
        validators=[
            DataRequired('please input description!')
        ],
        description='description',
        render_kw={
            'class': "form-control",
            'rows': "10",
        }
    )
    logo = FileField(
        label='logo',
        validators=[
            DataRequired('please upload logo！')
        ],
        description='logo',
    )
    star = SelectField(
        label='star',
        description='star',
        coerce=int,
        choices=[(0, '0 star'), (1, '1 star'), (2, '2 star'), (3, '3 star'), (4, '4 star'), (5, '5 star')],
        render_kw={
            'class': "form-control"
        }
    )
    genre_id = SelectField(
        label='genre',
        validators=[
            DataRequired('please select genre！')
        ],
        coerce=int,
        description='genre',
        render_kw={
            'class': "form-control"
        }
    )
    director_id = SelectField(
        label='director',
        validators=[
            DataRequired('please select director！')
        ],
        coerce=int,
        description='director',
        render_kw={
            'class': "form-control"
        }
    )

    def __init__(self, *args, **kwargs):
        super(FilmForm, self).__init__(*args, **kwargs)
        self.genre_id.choices = [(v.id, v.name) for v in Genre.query.all()]
        self.director_id.choices=[(v.id, v.name) for v in Director.query.all()]

    release_length = StringField(
        label='release length',
        validators=[
            DataRequired('please input release length!')
        ],
        description='release length',
        render_kw={
            'class': "form-control",
            'placeholder': "please input release length!",
        }
    )
    release_time = DateField(
        label='release time',
        validators=[
            DataRequired('please select release time!')
        ],
        description='release time',
        render_kw={
            'class': "form-control",
            'placeholder': "please select release time!",
            'id': "input_release_time"
        }
    )
    submit = SubmitField(
        label='submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )