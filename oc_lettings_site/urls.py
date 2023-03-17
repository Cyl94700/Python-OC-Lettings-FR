from django.contrib import admin
from django.urls import path, include


def trigger_error(request):
    division_by_zero = 1 / 0
    return division_by_zero


urlpatterns = [
    path('', include('oc_lettings_site.home_site.urls')),
    path('', include('oc_lettings_site.lettings.urls')),
    path('', include('oc_lettings_site.profiles.urls')),
    path('admin/', admin.site.urls),
    path('sentry-debug/', trigger_error),
]
