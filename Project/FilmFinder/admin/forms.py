from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, SelectField, FileField, SelectMultipleField, \
    DateTimeField, DateField
from wtforms.validators import DataRequired, ValidationError, EqualTo
from FilmFinder.models import Admin, Genre, Director, User


class LoginFrom(FlaskForm):
    account = StringField(
        label='Name',
        validators=[
            DataRequired('Please input name!')
        ],
        description='Name',
        render_kw={
            'class': "form-control",
            'placeholder': "Please input name",
            'required': "required"
        }
    )

    password = PasswordField(
        label='password',
        validators=[
            DataRequired('Please input password!')
        ],
        description='Password',
        render_kw={
            'class': "form-control",
            'placeholder': "Please input password",
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
            raise ValidationError('Account is not existing')


class GenreForm(FlaskForm):
    name = StringField(
        label='Genre',
        validators=[
            DataRequired('It can not be empty!')
        ],
        description='genre',
        render_kw={
            'class': "form-control",
            'id': "input_name",
            'placeholder': "Please input genre!"
        }
    )
    submit = SubmitField(
        label='Submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )


class DirectorForm(FlaskForm):
    name = StringField(
        label='Director',
        validators=[
            DataRequired('It can not be empty!')
        ],
        description='Director',
        render_kw={
            'class': "form-control",
            'id': "input_name",
            'placeholder': "Please input director!"
        }
    )
    submit = SubmitField(
        label='Submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )


class BlackForm(FlaskForm):
    user_id = SelectField(
        label='Genre',
        validators=[
            DataRequired('Please select genre！')
        ],
        coerce=int,
        description='Genre',
        render_kw={
            'class': "form-control"
        }
    )

    def __init__(self, *args, **kwargs):
        super(BlackForm, self).__init__(*args, **kwargs)
        self.user_id.choices = [(v.id, v.name) for v in User.query.all()]

    submit = SubmitField(
        label='Submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )


class FilmForm(FlaskForm):
    name = StringField(
        label='Name',
        validators=[
            DataRequired('please input Name!')
        ],
        description='Name',
        render_kw={
            'class': "form-control",
            'placeholder': "Please input name!"
        }
    )
    description = TextAreaField(
        label='Description',
        validators=[
            DataRequired('Please input description!')
        ],
        description='Description',
        render_kw={
            'class': "form-control",
            'rows': "10",
        }
    )
    logo = FileField(
        label='logo',
        validators=[
            DataRequired('Please upload logo！')
        ],
        description='Logo',
    )
    star = SelectField(
        label='Star',
        description='Star',
        coerce=int,
        choices=[(0, '0 star'), (1, '1 star'), (2, '2 star'), (3, '3 star'), (4, '4 star'), (5, '5 star')],
        render_kw={
            'class': "form-control"
        }
    )
    genre_id = SelectField(
        label='Genre',
        validators=[
            DataRequired('Please select genre！')
        ],
        coerce=int,
        description='Genre',
        render_kw={
            'class': "form-control"
        }
    )
    director_id = SelectField(
        label='Director',
        validators=[
            DataRequired('Please select director！')
        ],
        coerce=int,
        description='Director',
        render_kw={
            'class': "form-control"
        }
    )

    def __init__(self, *args, **kwargs):
        super(FilmForm, self).__init__(*args, **kwargs)
        self.genre_id.choices = [(v.id, v.name) for v in Genre.query.all()]
        self.director_id.choices=[(v.id, v.name) for v in Director.query.all()]

    release_length = StringField(
        label='Release length',
        validators=[
            DataRequired('please input release length!')
        ],
        description='Release length',
        render_kw={
            'class': "form-control",
            'placeholder': "Please input release length!",
        }
    )
    release_time = DateField(
        label='Release time',
        validators=[
            DataRequired('Please select release time!')
        ],
        description='Release time',
        render_kw={
            'class': "form-control",
            'placeholder': "Please select release time!",
            'id': "input_release_time"
        }
    )
    submit = SubmitField(
        label='Submit',
        render_kw={
            'class': "btn btn-primary"
        }
    )
