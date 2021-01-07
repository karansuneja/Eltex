from django.contrib import admin
from django.urls import path
from review.views import review
from product.views import product

urlpatterns = [
    path("review/<int:id>/",review,name='review'),
    path("details/<int:id>/",product,name='product'),
]