from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, FileField, SelectField
from wtforms.validators import DataRequired, ValidationError, EqualTo
from FilmFinder.models import User


class RegisterForm(FlaskForm):
    name = StringField(
        label='nick name',
        validators=[
            DataRequired('please input nick name!')
        ],
        description='nick name',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input nick name!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    first_name = StringField(
        label='first name',
        validators=[
            DataRequired('please input first name!'),
        ],
        description='first name',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input first name!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    second_name = StringField(
        label='second name',
        validators=[
            DataRequired('please input second name!'),
        ],
        description='second name',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input second name!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )

    email = StringField(
        label='email',
        validators=[
            DataRequired('please input email!'),
        ],
        description='email',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input email",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    phone = StringField(
        label='phone',
        validators=[
            DataRequired('please input phone!'),
        ],
        description='phone',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input phone!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    password = PasswordField(
        label='password',
        validators=[
            DataRequired('please input password!')
        ],
        description='password',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input password!",
            'required': "required"
        }
    )
    repassword = PasswordField(
        label='repassword',
        validators=[
            DataRequired('please input repassword!'),
            EqualTo('password', message='password is not match')
        ],
        description='repassword',
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input repassword!",
            'required': "required"
        }
    )
    submit = SubmitField(
        label='submit',
        render_kw={
            'class': "btn btn-lg btn-success btn-block"
        }
    )

    def validate_name(self, field):
        name = field.data
        num = User.query.filter_by(name=name).count()
        if num == 1:
            raise ValidationError('nick name exists already')

    def validate_email(self, field):
        email = field.data
        num = User.query.filter_by(email=email).count()
        if num == 1:
            raise ValidationError('email exists already')

    def validate_phone(self, field):
        phone = field.data
        num = User.query.filter_by(phone=phone).count()
        if num == 1:
            raise ValidationError('phone exists already')


class LoginFrom(FlaskForm):
    name = StringField(
        label='name',
        validators=[
            DataRequired('please input name!')
        ],

        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input name!",
            'required': "required"
        }
    )

    password = PasswordField(
        label='password',
        validators=[
            DataRequired('please input password！')
        ],
        render_kw={
            'class': "form-control input-lg",
            'placeholder': "please input password！",
            'required': "required",
            'autofocus': 'autofocus'
        }
    )
    submit = SubmitField(
        label='login',
        render_kw={
            'class': "btn btn-lg btn-success btn-block"
        }
    )

    def validate_name(self, field):
        account = field.data
        num = User.query.filter_by(name=account).count()
        if num == 0:
            raise ValidationError('account is not existed')


class UserDetailForm(FlaskForm):
    name = StringField(
        label='nick name',
        validators=[
            DataRequired('please input nick name!')
        ],
        description='nick name',
        render_kw={
            'class': "form-control",
            'placeholder': "please input nick name!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    email = StringField(
        label='email',
        validators=[
            DataRequired('please input email!'),
        ],
        description='email',
        render_kw={
            'class': "form-control",
            'placeholder': "please input email!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    phone = StringField(
        label='phone',
        validators=[
            DataRequired('please input phone!'),
        ],
        description='phone',
        render_kw={
            'class': "form-control",
            'placeholder': "please input phone!",
            'required': "required",
            'autofocus': "autofocus"
        }
    )
    face = FileField(
        label='face',
        validators=[
            DataRequired('please upload face!')
        ],
        description='face',
    )
    submit = SubmitField(
        label='save',
        render_kw={
            'class': "btn btn-success"
        }
    )


class CommentForm(FlaskForm):
    content = TextAreaField(
        label='content',
        validators=[
            DataRequired('please input content!')
        ],
        description='content',
        render_kw={
            # 'id': "input_content"
            'class': "form-control",
            'rows': "5"
        }
    )
    star = SelectField(
        label='star',
        validators=[
            DataRequired('please select star！')
        ],
        description='star',
        coerce=int,
        choices=[(1, '1 star'), (2, '2 star'), (3, '3 star'), (4, '4 star'), (5, '5 star')],
        render_kw={
            'class': "form-control"
        }
    )
    submit = SubmitField(
        label='submit',
        render_kw={
            "class": "btn btn-success",
            "id": "btn-sub"
        }
    )
