from socket import fromshare
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import User

class registration(UserCreationForm):
    first_name = forms.CharField(max_length = 65)
    last_name = forms.CharField(max_length = 65)
    is_customer = forms.BooleanField(required = False)
    is_analyst = forms.BooleanField(required = False)

    class Meta:
        model = User
        fields = ["username", "first_name", "last_name", "email", "password1", "password2", "is_customer", "is_analyst"]