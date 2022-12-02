from django import forms
from django.contrib.auth.forms import UserCreationForm

from custom_user.models import CustomUser, Countries

class RegisterForm(UserCreationForm):
    nombre = forms.CharField(max_length=45)
    COUNTRIES = []
    for p in Countries.objects.raw("SELECT * FROM countries"):
        COUNTRIES.append((p.idcountries, p.name))
    country = forms.IntegerField(widget=forms.Select(choices=COUNTRIES))

    class Meta:
        model = CustomUser
        fields = ("nombre", "country", "password1", "password2")

    def save(self, commit=True):
        user = super(RegisterForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user