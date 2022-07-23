from django.urls import path

from .views import api_home, create_student

urlpatterns = [
    path('', api_home),
    path('create', create_student)
]