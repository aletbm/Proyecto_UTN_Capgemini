# Generated by Django 4.0 on 2022-11-28 17:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Countries',
            fields=[
                ('idcountries', models.SmallAutoField(db_column='idCountries', primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=45, unique=True)),
                ('iso', models.CharField(db_column='ISO', max_length=2, unique=True)),
            ],
            options={
                'db_table': 'countries',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pregunta',
            fields=[
                ('idpregunta', models.AutoField(db_column='idPregunta', primary_key=True, serialize=False)),
                ('respuesta', models.PositiveIntegerField()),
                ('pregunta', models.CharField(max_length=300)),
                ('opcion1', models.CharField(blank=True, max_length=45, null=True)),
                ('opcion2', models.CharField(blank=True, max_length=45, null=True)),
                ('opcion3', models.CharField(blank=True, max_length=45, null=True)),
                ('opcion4', models.CharField(blank=True, max_length=45, null=True)),
                ('opcion5', models.CharField(blank=True, max_length=45, null=True)),
            ],
            options={
                'db_table': 'pregunta',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Puntuacionmax',
            fields=[
                ('idpuntuacion', models.AutoField(db_column='idPuntuacion', primary_key=True, serialize=False)),
                ('puntuacion', models.PositiveIntegerField()),
                ('fecha', models.DateField()),
            ],
            options={
                'db_table': 'puntuacionmax',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('idusuario', models.AutoField(db_column='idUsuario', primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=45)),
                ('contrasenia', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'usuario',
                'managed': False,
            },
        ),
        migrations.AlterModelOptions(
            name='tema',
            options={'managed': False},
        ),
    ]
