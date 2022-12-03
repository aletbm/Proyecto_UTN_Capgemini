from django import forms
from django.contrib.auth import authenticate
from collections import OrderedDict
from django.contrib.auth.forms import PasswordChangeForm

from custom_user.models import CustomUser, Countries

class UpdateCustomUserData(forms.ModelForm):
    COUNTRIES = []
    for p in Countries.objects.raw("SELECT * FROM countries"):
        COUNTRIES.append((p.idcountries, p.name))
    country = forms.IntegerField(widget=forms.Select(choices=COUNTRIES))

    class Meta:
        model = CustomUser
        fields = ("nombre", "country")

    def clean_nombre(self):
        if self.is_valid():
            nombre = self.cleaned_data['nombre']
            try:
                account = CustomUser.objects.exclude(pk=self.instance.pk).get(nombre=nombre)
            except CustomUser.DoesNotExist:
                return nombre
            raise forms.ValidationError('Nombre "%s" ya esta en uso.' % nombre)

class UpdateCustomUserPassword(PasswordChangeForm):
    class Meta:
        model = CustomUser
        fields = ("old_password", "new_password1", "new_password2")

    def clean_old_password(self):
        old_password = self.cleaned_data["old_password"]
        if not self.user.check_password(old_password):
            raise forms.ValidationError(
                self.error_messages['password_incorrect'],
                code='password_incorrect',
            )
        return old_password
    
    def save(self, commit=True):
        user = super(UpdateCustomUserPassword, self).save(commit=False)
        user.set_password(self.cleaned_data["new_password1"])
        if commit:
            user.save()
        return user

UpdateCustomUserPassword.base_fields = OrderedDict(
    (k, UpdateCustomUserPassword.base_fields[k])
    for k in ['old_password', 'new_password1', 'new_password2']
)