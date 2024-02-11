from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Favoritos
from .models import Series
from django.views.decorators.csrf import csrf_exempt

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

#Put Favoritos
@csrf_exempt
def favoritosview(request):
	if request.method == 'PUT':
                # Obtener el session token del encabezado
		session_token = request.headers.get('SessionToken')

                # Verificar la sesión del usuario
		usuario = Users.objects.filter(sessiontoken=session_token).first()
		if not usuario:
			return JsonResponse({'error': 'Unauthorized'}, status=401)

                # Obtener datos del cuerpo de la solicitud
		data = request.body.decode('utf-8')
		data_dict= json.loads(data)
		id_pelicula = data_dict.get('idPelicula')
		id_serie = data_dict.get('idSerie')
		es_favorito = data_dict.get('esFavorito')

        # Verificar si se proporciona id de película o serie
		if id_pelicula:
			pelicula = Peliculas.objects.filter(id=id_pelicula).first()
			if not pelicula:
				return JsonResponse({'error': 'Not Found'}, status=404)

            # Marcar o desmarcar como favorita la película
			Favoritos.objects.update_or_create(
				peliculaid=pelicula,
				userid=usuario,
				defaults={'esfavorito': es_favorito}
			)
		elif id_serie:
			serie = Series.objects.filter(id=id_serie).first()
			if not serie:
				return JsonResponse({'error': 'Not Found'}, status=404)

            # Marcar o desmarcar como favorita la serie
			Favoritos.objects.update_or_create(
				serieid=serie,
				userid=usuario,
				defaults={'esfavorito': es_favorito}
			)
		else:
			return JsonResponse({'error': 'Bad Request'}, status=400)

		return JsonResponse({'success': 'OK'}, status=200)
	else:
		return JsonResponse({'error': 'Method Not Allowed'}, status=405)

#Logaut 

@csrf_exempt
def logout(request, user_id):
    # Comprobación de token
	error_response, payload = verify_token(request)
	if error_response:
		return error_response

	if request.method != 'PATCH':
		return JsonResponse({'error': 'Método no permitido'}, status=405)

	try:
		user = Users.objects.get(pk=user_id)
		user.sessiontoken = None  # o user.session_token =
		user.save()
		return JsonResponse({'message': 'Sesión cerrada exitosamente'}, status=200)
	except Users.DoesNotExist:
		return JsonResponse({'error': 'Faltan parametros o son incorrectos'}, status=400)
	except Exception as e:
		return JsonResponse({'error':'Unauthorized'},status=401)
