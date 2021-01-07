from django.contrib import admin
from django.urls import path
from compare.views import addcom,compare,clear

urlpatterns = [
	path("addcom/<int:id>/",addcom,name='addcom'),
	path("compare.html/",compare,name='compare'),
	path("compare1.html/",clear,name='clear')
]
