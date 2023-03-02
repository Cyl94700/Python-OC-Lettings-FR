from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('', include('oc_lettings_site.lettings.urls')),
    path('', include('oc_lettings_site.profiles.urls')),
    path('admin/', admin.site.urls),
]
