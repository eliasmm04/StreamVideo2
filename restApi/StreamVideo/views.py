from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Peliculas

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

        pelicula = Tpeliculas.objects.get(id=pelicula.id)
        comentario = Tcomentarios(comentario=nuevo_comentario, pelicula=pelicula)
        comentario.save()

        comentarios_actualizados = list(pelicula.tcomentarios_set.values('id', 'comentario'))

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

                serie = Tseries.objects.get(id=serie.id)
                comentario = Tcomentarios(comentario=nuevo_comentario, serie=serie)
                comentario.save()

                comentarios_actualizados = list(serie.tcomentarios_set.values('id','comentario'))

                return JsonResponse({'status':'ok','comentarios':comentarios_actualizados},status=201)

        except json.JSONDecodeError:
                return JsonResponse({'error':'Error al decodificar el Json'}, status=400)
        except Tseries.DoesNotExist:
                return JsonResponse({'error':'La serie no existe'}, status=404)
        except Exception as e:
                return JsonResponse({'error': str(e)} ,status=500)





