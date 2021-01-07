from django.contrib import admin
from django.urls import path
from product.views import product

urlpatterns = [
    path("details/<int:id>/",product,name='details'),
]