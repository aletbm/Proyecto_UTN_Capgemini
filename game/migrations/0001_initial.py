# Generated by Django 4.0 on 2022-11-23 16:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('idUsuario', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=45)),
                ('contrasenia', models.CharField(max_length=45)),
                ('Countries_idCountries', models.IntegerField()),
                ('PuntuacionMAx_idPuntuacion', models.IntegerField()),
            ],
        ),
    ]