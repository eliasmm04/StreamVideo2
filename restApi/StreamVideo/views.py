from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas
from .models import Comentariospeliculas
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

# Get series by id



SECRET_KEY = 'claveTremendamentesegura.'

def crear_token(user_id):
	payload = {
		'id': user_id,
		'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1),
		'iat': datetime.datetime.utcnow()
	}
	token = jwt.encode(payload, SECRET_KEY, algorithm='HS256')
	return token

def verify_token(request):
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

