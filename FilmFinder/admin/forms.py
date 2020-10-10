from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, SelectField, FileField, SelectMultipleField
from wtforms.validators import DataRequired, ValidationError, EqualTo
from ..models import Admin, Genre


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


class FilmForm(FlaskForm):
    title = StringField(
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
    info = TextAreaField(
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
    score = SelectField(
        label='score',
        validators=[
            DataRequired('please select star！')
        ],
        description='star',
        coerce=int,
        choices=[(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5')],
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
        # choices=[(tag.id, tag.name) for tag in Tag.query.all()],
        description='genre',
        render_kw={
            'class': "form-control"
        }
    )

    def __init__(self, *args, **kwargs):
        super(FilmForm, self).__init__(*args, **kwargs)
        self.genre_id.choices = [(v.id, v.name) for v in Genre.query.all()]

    length = StringField(
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
    release_time = StringField(
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