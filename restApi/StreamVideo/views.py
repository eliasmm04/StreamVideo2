from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Favoritos
from .models import Series

def devolver_peliculas(request):
	lista = Peliculas.objects.all()
	respuesta_final = []
	for fila_sql in lista:
		diccionario = {}
		diccionario['id'] = fila_sql.id
		diccionario['nombre'] = fila_sql.nombre
		diccionario['genero'] = fila_sql.genero
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

# get favoritos peliculas
def devolver_peliculas_favoritas(request):
    # Obtén el usuario actual
	usuario = request.user
    # Verifica si el usuario está autenticado
	if usuario.is_authenticated:
        # Filtra los favoritos del usuario actual
		favoritos = Favoritos.objects.filter(userid=usuario)
        # Lista para almacenar los resultados
		lista_favorito = []
        # Itera sobre los favoritos y obtén las películas asociadas
		for favorito in favoritos:
			pelicula = favorito.peliculaid
			diccionario = {
				'id': pelicula.id,
				'nombre': pelicula.nombre,
				'genero': pelicula.genero,
			}
			lista_favorito.append(diccionario)
        # Devuelve la respuesta en formato JSON
		return JsonResponse(lista_favorito, safe=False)
    # Si el usuario no está autenticado, puedes manejarlo de la manera que prefieras
	else:
		mensaje_error = {'error': 'Usuario no autenticado'}
		return JsonResponse(mensaje_error)


#get favoritos de series

def devolver_series(request):
	lista = Series.objects.all()
	respuesta_final = []
	for fila_sql in lista:
		diccionario = {}
		diccionario['id'] = fila_sql.id
		diccionario['nombre'] = fila_sql.nombre
		diccionario['genero'] = fila_sql.genero
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

# get favoritos peliculas
def devolver_series_favoritas(request):
    # Obtén el usuario actual
	usuario = request.user
    # Verifica si el usuario está autenticado
	if usuario.is_authenticated:
        # Filtra los favoritos del usuario actual
		favoritos = Favoritos.objects.filter(userid=usuario)
        # Lista para almacenar los resultados
		lista_favorito = []
        # Itera sobre los favoritos y obtén las películas asociadas
		for favorito in favoritos:
			serie = favorito.serieid
			diccionario = {
				'id': serie.id,
				'nombre': serie.nombre,
				'genero': serie.genero,
			}
			lista_favorito.append(diccionario)
        # Devuelve la respuesta en formato JSON
		return JsonResponse(lista_favorito, safe=False)
    # Si el usuario no está autenticado, puedes manejarlo de la manera que prefieras
	else:
		mensaje_error = {'error': 'Usuario no autenticado'}
		return JsonResponse(mensaje_error)
