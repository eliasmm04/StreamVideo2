"""restApi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from StreamVideo import views

urlpatterns = [
    path('admin/',admin.site.urls),
    path('peliculas' , views.devolver_peliculas),
    path('series' , views.devolver_series),
    path('peliculas/<int:id_solicitado>' , views.devolver_peliculas_por_id),
    path('series/<int:id_solicitado>' , views.devolver_series_por_id),
    path('peliculas/<int:id_solicitado>/comentarios' , views.comentarios_Peliculas),
    path('series/<int:id_solicitado>/comentarios' , views.comentarios_Series),
    path('agregarUsuarios' , views.user_post),
    path('peliculasfav' , views.devolver_peliculas_favoritas),
    path('seriesfav' , views.devolver_series_favoritas),
    path('favoritos' , views.favoritosview),
    path('logout/<int:user_id>', views.logout)
]
