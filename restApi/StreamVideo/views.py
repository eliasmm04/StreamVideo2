from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Comentariospeliculas
from .models import Series
from .models import Plataformas
from .models import Users
from .models import Actor 
import json
from django.views.decorators.csrf import csrf_exempt


# Create your views here.
# Get de peliculas
def devolver_peliculas(request):
	lista=Peliculas.objects.all()
	respuesta_final=[]
	for fila_sql in lista:
		diccionario={}
		diccionario['id']= fila_sql.id
		diccionario['nombre']=fila_sql.nombre
		diccionario['genero']=fila_sql.genero
		diccionario['año']=fila_sql.año
		#Preguntar a Carlos pq esto decide implosionar(No serializable)
		#diccionario['plataformaid']=fila_sql.plataformaid
		diccionario['descripcion']=fila_sql.descripcion
		diccionario['urlimagen']=fila_sql.urlimagen
		#diccionario['actorid']=fila_sql.actorid
		diccionario['duracion']=fila_sql.duracion
		diccionario['valoracion']=fila_sql.valoracion
		#diccionario['comentarioid']=fila_sql.comentarioid
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)





#get peliculas by id
def devolver_peliculas_por_id(request, id_solicitado):
	pelicula=Peliculas.objects.get(id=id_solicitado)
	comentarios=pelicula.comentariospeliculas_set.all()
	lista_comentarios=[]
	for fila_comentario_sql in comentarios:
		diccionario={}
		diccionario['id']= fila_comentario_sql.id
		diccionario['comentario']=fila_comentario_sql.comentario
		lista_comentarios.append(diccionario)
	resultado={
		'id':pelicula.id,
		'nombre':pelicula.nombre,
		'año':pelicula.año,
		'comentarios':lista_comentarios
	}
	return JsonResponse(resultado, json_dumps_params={'ensure_ascii':False})


#get de series
def devolver_series(request):
	lista=Series.objects.all()
	respuesta_final=[]
	for fila_sql in lista:
		diccionario={}
		diccionario['id']= fila_sql.id
		diccionario['nombre']=fila_sql.nombre
		diccionario['genero']=fila_sql.genero
		diccionario['año']=fila_sql.año
		diccionario['numerotemporadas']=fila_sql.numtemporadas
                #Preguntar a Carlos pq esto decide implosionar(No serializable)
		#diccionario['plataformaid']=fila_sql.plataformaid
		diccionario['descripcion']=fila_sql.descripcion
		diccionario['urlimagen']=fila_sql.urlimagen
		#diccionario['actorid']=fila_sql.actorid
		diccionario['valoracion']=fila_sql.valoracion
		diccionario['comentarioid']=fila_sql.comentarioid
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

# Get series by id
def devolver_series_por_id(request, id_solicitado):
        serie=Series.objects.get(id=id_solicitado)
        comentarios=serie.comentariosseries_set.all()
        lista_comentarios=[]
        for fila_comentario_sql in comentarios:
                diccionario={}
                diccionario['id']= fila_comentario_sql.id
                diccionario['comentario']=fila_comentario_sql.comentario
                lista_comentarios.append(diccionario)
        resultado={
                'id':serie.id,
                'nombre':serie.nombre,
                'año':serie.año,
                'comentarios':lista_comentarios
        }
        return JsonResponse(resultado, json_dumps_params={'ensure_ascii':False})
