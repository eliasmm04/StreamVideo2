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

def devolver_peliculas_por_id(request, id_solicitado):
	pelicula=Peliculas.objects.get(id=id_solicitado)
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

@csrf_exempt

def PostPeliculaComentarios(request, peliculaId):
    if request.method == 'POST':
        session_token = request.headers.get('SesionToken')
        usuario = Users.objects.filter(sesiontoken=session_token).first()
        if not usuario:
        	return JsonResponse({"error": "Unauthorized"}, status=401)
    try:
        json_peticion = json.loads(request.body)
        nuevo_comentario = json_peticion.get('nuevo_comentario')

        if not nuevo_comentario:
        	return JsonResponse({"error": "Falta el nuevo comentario en la solicitud."}, status=400)

        pelicula = Peliculas.objects.get(id=pelicula.id)
        comentario = Comentariospeliculas(comentario=nuevo_comentario, pelicula=pelicula)
        comentario.save()

        comentarios_actualizados = list(pelicula.Comentariospeliculas_set.values('id', 'comentario'))

        return JsonResponse({"status": "ok", "comentarios": comentarios_actualizados}, status=201)

    except json.JSONDecodeError:
        return JsonResponse({"error": "Error al decodificar el JSON."}, status=400)
    except Tpeliculas.DoesNotExist:
        return JsonResponse({"error": "La pelicula no existe."}, status=404)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)

@crsf_exempt

def devolver_comentarios_series (request, serieId ):
        if request.method == 'POST':
                session_token = request.headers.get('SesionToken')
                usuario = Users.objects.filter(sesiontoken=session_token).first()
                if not usuario:
                	return JsonResponse({'error':'Unauthorized'}, status=401)
        try
                json_peticion = json.loads(request.body)
                nuevo_comentario = json_peticion.get('nuevo comentario')
        
                if not nuevo_comentario:
                        return JsonResponse({'error':'falta el nuevo comentario en la solicitud'},estatus=400)

                serie = Series.objects.get(id=serie.id)
                comentario = Comentariosseries(comentario=nuevo_comentario, serie=serie)
                comentario.save()

                comentarios_actualizados = list(serie.Comentariosseries_set.values('id','comentario'))

                return JsonResponse({'status':'ok','comentarios':comentarios_actualizados},status=201)

        except json.JSONDecodeError:
                return JsonResponse({'error':'Error al decodificar el Json'}, status=400)
        except Tseries.DoesNotExist:
                return JsonResponse({'error':'La serie no existe'}, status=404)
        except Exception as e:
                return JsonResponse({'error': str(e)} ,status=500)


