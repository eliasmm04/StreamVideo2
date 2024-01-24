# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Actor(models.Model):
    nombre = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    edad = models.IntegerField()
    peliculaid = models.ForeignKey('Peliculas', models.DO_NOTHING, db_column='peliculaId', blank=True, null=True)  # Field name made lowercase.
    serieid = models.ForeignKey('Series', models.DO_NOTHING, db_column='serieId', blank=True, null=True)  # Field name made lowercase.
    nombreficticio = models.CharField(db_column='nombreFicticio', max_length=50)  # Field name made lowercase.
    foto = models.CharField(max_length=500)

    class Meta:
        managed = False
        db_table = 'actor'


class Comentariospeliculas(models.Model):
    comentario = models.CharField(max_length=800, blank=True, null=True)
    peliculaid = models.ForeignKey('Peliculas', models.DO_NOTHING, db_column='peliculaId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'comentariospeliculas'


class Comentariosseries(models.Model):
    comentario = models.CharField(max_length=800, blank=True, null=True)
    serieid = models.ForeignKey('Series', models.DO_NOTHING, db_column='serieId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'comentariosseries'


class Favoritos(models.Model):
    peliculaid = models.ForeignKey('Peliculas', models.DO_NOTHING, db_column='peliculaId', blank=True, null=True)  # Field name made lowercase.
    serieid = models.ForeignKey('Series', models.DO_NOTHING, db_column='serieId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId')  # Field name made lowercase.
    esfavorito = models.IntegerField(db_column='esFavorito')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'favoritos'


class Peliculas(models.Model):
    nombre = models.CharField(max_length=50)
    genero = models.CharField(max_length=200)
    año = models.TextField()  # This field type is a guess.
    plataformaid = models.ForeignKey('Plataformas', models.DO_NOTHING, db_column='plataformaId')  # Field name made lowercase.
    descripcion = models.CharField(max_length=300)
    urlimagen = models.CharField(db_column='urlImagen', max_length=5500)  # Field name made lowercase.
    actorid = models.ForeignKey(Actor, models.DO_NOTHING, db_column='actorId')  # Field name made lowercase.
    duracion = models.IntegerField()
    valoracion = models.IntegerField()
    comentarioid = models.ForeignKey(Comentariospeliculas, models.DO_NOTHING, db_column='comentarioId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'peliculas'


class Plataformas(models.Model):
    nombre = models.CharField(max_length=100)
    peliculaid = models.ForeignKey(Peliculas, models.DO_NOTHING, db_column='peliculaId', blank=True, null=True)  # Field name made lowercase.
    serieid = models.ForeignKey('Series', models.DO_NOTHING, db_column='serieId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'plataformas'


class Series(models.Model):
    nombre = models.CharField(max_length=50)
    genero = models.CharField(max_length=30)
    año = models.TextField()  # This field type is a guess.
    numtemporadas = models.IntegerField(db_column='numTemporadas')  # Field name made lowercase.
    plataformaid = models.ForeignKey(Plataformas, models.DO_NOTHING, db_column='plataformaId')  # Field name made lowercase.
    descripcion = models.CharField(max_length=300)
    urlimagen = models.CharField(db_column='urlImagen', max_length=2000)  # Field name made lowercase.
    actorid = models.ForeignKey(Actor, models.DO_NOTHING, db_column='actorId')  # Field name made lowercase.
    valoracion = models.IntegerField()
    comentarioid = models.ForeignKey(Comentariosseries, models.DO_NOTHING, db_column='comentarioId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'series'


class Users(models.Model):
    nombre = models.CharField(max_length=50)
    apellidos = models.CharField(max_length=100)
    contraseña = models.CharField(max_length=200)
    telefono = models.CharField(max_length=9, blank=True, null=True)
    email = models.CharField(max_length=100)
    favoritoid = models.ForeignKey(Favoritos, models.DO_NOTHING, db_column='favoritoId')  # Field name made lowercase.
    comentariopeliculaid = models.ForeignKey(Comentariospeliculas, models.DO_NOTHING, db_column='comentariopeliculaId')  # Field name made lowercase.
    comentarioserieid = models.ForeignKey(Comentariosseries, models.DO_NOTHING, db_column='comentarioserieId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'users'
