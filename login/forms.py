from django import forms
from django.contrib.auth import authenticate

from custom_user.models import CustomUser

class LoginForm(forms.Form):
    nombre = forms.CharField(max_length=45)
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ("nombre", "password")
    
    def clean(self):
        cleaned_data = super().clean()
        nombre = cleaned_data.get("nombre")
        password = cleaned_data.get("password")
        if not authenticate(nombre=nombre, password=password):
            raise forms.ValidationError("El nombre o la contraseña son incorrectos")