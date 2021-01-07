from django.contrib import admin
from django.urls import path
from cart.views import addc,cart,remove,aj_addc

urlpatterns = [
	path("addc/<int:id>/",addc,name='addc'),
	path("cart.html/",cart,name='cart'),
	path("remove/<int:id>/",remove,name='remove'),
	path("addcaa/",aj_addc,name='aj_addc'),

]

