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


