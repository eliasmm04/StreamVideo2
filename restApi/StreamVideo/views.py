import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Series
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from .models import Actor
from .models import Plataformas

# Create your views here.

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
	else:
		return JsonResponse({"Error: no se encuentra la URL"}, status=404)

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
	else:
		return JsonResponse({"Error: no se ha encontrado la dirección"}, status=404)

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
				'peliculaId': actores.peliculaid.id if actores.peliculaid is not None else None,
				'serieId': actores.serieid.id if actores.serieid is not None else None, 
				'nombreFicticio': actores.nombreficticio,
				'foto': actores.foto
			} for actores in actor
		]

		return JsonResponse({'actores': actores_data, 'total': paginator.count, 'page': page}, status=200)
	else:
		return JsonResponse({"Error: no se ha encontrado la dirección"}, status=404)

@csrf_exempt
def plataformas_nombre(request, plataformas_name):
	if request.method == 'GET':
		plataformas = Plataformas.objects.filter(nombre = plataformas_name)
		array = []
		for plataforma in plataformas:
			diccionario = {}
			diccionario['id'] = plataforma.id
			diccionario['peliculaId'] = plataforma.peliculaid.id
			diccionario['serieId'] = plataforma.serieid.id
			array.append(diccionario)
		return JsonResponse(array, safe = False)
	else:
		return  JsonResponse({"Error: Unauthorized"}, status=401)


