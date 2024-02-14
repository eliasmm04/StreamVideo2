from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Favoritos
from .models import Series
from .models import Plataformas
from .models import Users
from .models import Actor 
from .models import Favoritos
import json,jwt
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import check_password
import  datetime
from django.core.paginator import Paginator
from django.views.decorators.http import require_POST

# Create your views here.
# Get de peliculas
# Devuelve los campos de la pelicula especificada 
def devolver_peliculas(request):
	lista=Peliculas.objects.all()
	respuesta_final=[]
	for fila_sql in lista:
		diccionario={}
		diccionario['id']= fila_sql.id
		diccionario['nombre']=fila_sql.nombre
		diccionario['genero']=fila_sql.genero
		diccionario['año']=fila_sql.año
		diccionario['plataformaid']=fila_sql.plataformaid.id
		diccionario['descripcion']=fila_sql.descripcion
		diccionario['urlimagen']=fila_sql.urlimagen
		diccionario['actorid']=fila_sql.actorid.id
		diccionario['duracion']=fila_sql.duracion
		diccionario['valoracion']=fila_sql.valoracion
		diccionario['comentarioid']=fila_sql.comentarioid.id
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)


#get de series
# Devuelve los campos de la serie especificada 
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
		diccionario['plataformaid']=fila_sql.plataformaid.id
		diccionario['descripcion']=fila_sql.descripcion
		diccionario['urlimagen']=fila_sql.urlimagen
		diccionario['actorid']=fila_sql.actorid.id
		diccionario['valoracion']=fila_sql.valoracion
		diccionario['comentarioid']=fila_sql.comentarioid.id
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

SECRET_KEY = 'claveTremendamentesegura.'
""" 
Crea un token JWT (JSON Web Token) para el usuario dado.
Returns:
        str: Token JWT generado.

"""
def crear_token(user_id):
	payload = {
		'id': user_id,
		'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1),
		'iat': datetime.datetime.utcnow()
	}
	token = jwt.encode(payload, SECRET_KEY, algorithm='HS256')
	return token

def verify_token(request):
	    """
    Verifica un token JWT incluido en la solicitud HTTP.

    Returns:
      		Una tupla con dos elementos:
            - JsonResponse o None: Si hay un error, devuelve una respuesta JSON con un mensaje de error.
            - dict or None: Si el token es válido, devuelve el payload decodificado.
    """
	token = request.META.get('HTTP_AUTHORIZATION',None)
	if not token:
		return JsonResponse({'message':'Token is missing!'}, status=401), None

	try:
		if token.startswith('Bearer '):
			token = token.split(' ')[1]
		payload = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
		return None, payload
	except jwt.ExpiredSignatureError:
		return JsonResponse({'message':'Token has expired'}, status=401), None
	except jwt.InvalidTokenError:
		return JsonResponse({'message':'Invalid token!'}, status=401), None

# login
# cuando inicias sesion la primera vez lo hace perfectamente y cuando cierras tambien lo hace correctamente pero cuando inicias sesion por segunda vez te sale el error de contraseña incorrecta aún poniendo la contraseña bien

@csrf_exempt
def login(request):

	if request.method == 'POST':
		try:
			data = json.loads(request.body)
			user = Users.objects.get(nombre=data['nombre'])
			if check_password(data['contraseña'], user.contraseña):
				token = crear_token(user.id)
				sessiontoken=crear_token(user.id)
				user.sessiontoken=sessiontoken
				user.save()
				return JsonResponse({'token':token}, status=200)
			else:
				return JsonResponse({'error': 'Contrasenia incorrecta'}, status=401)
		except Users.DoesNotExist:
			return JsonResponse({'error':'Usuario no encontrado'}, status=404)







@csrf_exempt
def register(request):
	if request.method == 'POST':
		try:
			data = json.loads(request.body.decode('utf-8'))
			usuario=Users()
			usuario.nombre=data['nombre']
			usuario.contraseña=data['contraseña']
			usuario.apellidos=data['apellidos']
			usuario.email=data['email']

            		# Verificar si los campos requeridos están presentes en los datos recibidos
			required_fields = ['nombre', 'contraseña', 'apellidos', 'email']
			for field in required_fields:
				if field not in data:
					return JsonResponse({'error': 'Faltan parámetros en la solicitud'}, status=400)

            # Verificar si ya existe un usuario con el mismo nombre o email
			if Users.objects.filter(nombre=data['nombre']).exists() or Users.objects.filter(email=data['email']).exists():
				return JsonResponse({'error': 'Ya existe un usuario con ese nombre o email'}, status=409)


            # Crear el nuevo usuario
			new_user = Users(
				nombre=data['nombre'],
				contraseña=data['contraseña'],
				apellidos=data['apellidos'],
				email=data['email'],
			)
			new_user.save()
			return JsonResponse({'message': 'Usuario registrado exitosamente'}, status=201)
		except Exception as e:
			return JsonResponse({'error':str(e)}, status=400)


#He borrado el get de películas ya que pertenecía a la rama de elías

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

#He borrado el get de series ya que pertenecía a la rama de elías

#get favoritos de series

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
	#Comprobamos que el método introducido en la petición sea solo PUT
	if request.method == 'PUT':
                # Obtener el session token del encabezado. Quizás, sería mas óptimo utilizar request.META.get('HTTP_AUTHORIZATION', None) para obtener el sessionToken
		session_token = request.headers.get('SessionToken')

                # Verificar la sesión del usuario. Además, otra mejora que se podría implementar sería cambiar el nombre de los tokens para que no sean tan confusos
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
			#Si no existe la película
			if not pelicula:
				return JsonResponse({'error': 'Not Found'}, status=404)

            # Marcar o desmarcar como favorita la película
			Favoritos.objects.update_or_create(
				peliculaid=pelicula,
				userid=usuario,
				#Este es el objeto que cambiaremos
				defaults={'esfavorito': es_favorito}
			)
		elif id_serie:
			serie = Series.objects.filter(id=id_serie).first()
			#Si no existe la serie
			if not serie:
				return JsonResponse({'error': 'Not Found'}, status=404)

            # Marcar o desmarcar como favorita la serie
			Favoritos.objects.update_or_create(
				serieid=serie,
				userid=usuario,
				#Este es el objeto que cambiaremos
				defaults={'esfavorito': es_favorito}
			)
		else:
			return JsonResponse({'error': 'Bad Request'}, status=400)

		return JsonResponse({'success': 'OK'}, status=200)
	else:
		return JsonResponse({'error': 'Method Not Allowed'}, status=405)

#Logout 

@csrf_exempt
def logout(request, user_id):
    # Comprobación de token. El error_response guarda la información que le proporciona el return del verify_token
	error_response, payload = verify_token(request)
	#Si existe el error se visualizará por pantalla
	if error_response:
		return error_response

	#Si el método introducido no es un PATCH, saltará el error
	if request.method != 'PATCH':
		return JsonResponse({'error': 'Método no permitido'}, status=405)

	try:
		#Cogemos todos los objetos del modelo Users que coincidan con el filtrado introducido
		user = Users.objects.get(pk=user_id)
		user.sessiontoken = None  # o user.session_token =
		#Guardamos el objeto sessiontoken con el valor Nulo y luego guardamos los cambios con user.save()
		user.save()
		return JsonResponse({'message': 'Sesión cerrada exitosamente'}, status=200)
	except Users.DoesNotExist:
		return JsonResponse({'error': 'Faltan parametros o son incorrectos'}, status=400)
	except Exception as e:
		return JsonResponse({'error':'Unauthorized'},status=401)
