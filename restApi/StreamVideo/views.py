import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Series
from django.views.decorators.csrf import csrf_exempt
from .models import Comentariospeliculas
from .models import Comentariosseries
from django.core.paginator import Paginator
from .models import Actor

# Create your views here.
def devolver_peliculas(request):
	lista=Peliculas.objects.all()
	respuesta_final=[]
	for fila_sql in lista:
		diccionario={}
		diccionario['id']= fila_sql.id
		diccionario['nombre']=fila_sql.nombre
		diccionario['genero']=fila_sql.genero
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

"""@csrf_exempt
def comentarios_Peliculas(request, pelicula_id):
	if request.method != 'POST':
		return ("Tua nai e unha santa")
	json_peticion = json.loads(request.body)
	comentario = Comentariospeliculas()
	comentario.comentario = json_peticion['nuevo_comentario']
	comentario.pelicula = Pelicula.objects.get(id = pelicula_id)
	comentario.save()
	return JsonResponse({"status:" "guardado correctamente"})

@csrf_exempt
def comentarios_Series(request, serie_id):
        if request.method != 'POST':
                return ("Tua nai e unha santa")
        json_peticion = json.loads(request.body)
        comentario = Comentariosseries()
        comentario.comentario = json_peticion['nuevo_comentario']
        comentario.series = Series.objects.get(id = serie_id)
        comentario.save()
        return JsonResponse({"status:" "guardado correctamente"})
"""

@csrf_exempt
def peliculas_nombre(request):
	if request.method == 'GET':
		peliculas_query = Peliculas.objects.all()
		#Búsqueda por nombre
		peliculas_search = request.GET.get('search', None)
		if peliculas_search:
			peliculas_query = peliculas_query.filter(nombre__icontains=peliculas_search)
		#Ordenación
		sort_by = request.GET.get('sort', 'nombre') #Defaul sort by 'nombre'
		peliculas_query = peliculas_query.order_by(sort_by)
		#Paginación
		paginator = Paginator(peliculas_query, request.GET.get('limit', 10))
		#10 películas por defecto
		page = request.GET.get('page', 1)
		peliculas = paginator.get_page(page)
		peliculas_data = [
			{     #Recordatorio: poner todos los campos en minusculas
				'id': pelicula.id,
				'nombre': pelicula.nombre,
				'genero': pelicula.genero,
				'año': pelicula.año,
				'plataformaId': pelicula.plataformaid.id,
				'descripcion': pelicula.descripcion,
				'urlImagen': pelicula.urlimagen,
				'actorId': pelicula.actorid.id,
				'duracion': pelicula.duracion,				
				'valoracion': pelicula.valoracion,
				'comentarioId': pelicula.comentarioid.id
			} for pelicula in peliculas
		]

		return JsonResponse({'peliculas': peliculas_data, 'total': paginator.count, 'page': page}, status=200)

@csrf_exempt
def series_nombre(request):
	if request.method == 'GET':
		series_query = Series.objects.all()
		#Búsqueda por nombre
		series_search = request.GET.get('search', None)
		if series_search:
			series_query = series_query.filter(nombre__icontains=series_search)
		#Ordenación
		sort_by = request.GET.get('sort', 'nombre') #Defaul sort by 'nombre'
		series_query = series_query.order_by(sort_by)
		#Paginación
		paginator = Paginator(series_query, request.GET.get('limit', 10))
		#10 películas por defecto
		page = request.GET.get('page', 1)
		series = paginator.get_page(page)
		series_data = [
			{     #Recordatorio: poner todos los campos en minusculas
				'id': serie.id,
				'nombre': serie.nombre,
				'genero': serie.genero,
				'año': serie.año,
				'plataformaId': serie.plataformaid.id,
				'descripcion': serie.descripcion,
				'urlImagen': serie.urlimagen,
				'actorId': serie.actorid.id,
				'numTemporadas': serie.numtemporadas,
				'comentarioId': serie.comentarioid.id
			} for serie in series
		]

	return JsonResponse({'series': series_data, 'total': paginator.count, 'page': page}, status=200)


@csrf_exempt
def actores_nombre(request):
	if request.method == 'GET':
		actores_query = Actor.objects.all()
		#Búsqueda por nombre
		actores_search = request.GET.get('search', None)
		if actores_search:
			actores_query = actores_query.filter(nombre__icontains=actores_search)
		#Ordenación
		sort_by = request.GET.get('sort', 'nombre') #Defaul sort by 'nombre'
		actores_query = actores_query.order_by(sort_by)
		#Paginación
		paginator = Paginator(actores_query, request.GET.get('limit', 10))
		#10 películas por defecto
		page = request.GET.get('page', 1)
		actor = paginator.get_page(page)
		actores_data = [
			{     #Recordatorio: poner todos los campos en minusculas
				'id': actores.id,
				'nombre': actores.nombre,
				'apellidos': actores.apellidos,
				'edad': actores.edad,
				'peliculaId': actores.peliculaid.pk,
				'serieId': actores.serieid.pk, 
				'nombreFicticio': actores.nombreficticio,
				'foto': actores.foto
			} for actores in actor
		]

	return JsonResponse({'actores': actores_data, 'total': paginator.count, 'page': page}, status=200)

