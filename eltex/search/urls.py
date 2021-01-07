from django.contrib import admin
from django.urls import path
from search.views import search

urlpatterns = [
	path("search.html/",search,name='search')
]