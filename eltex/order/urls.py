from django.contrib import admin
from django.urls import path
from order.views import checkout,confirm,myorders,handlerequest,cod

urlpatterns = [
	path("checkout.html/",checkout,name='checkout'),
	path("confirm.html/",confirm,name='confirm'),
	path("myorders.html/",myorders,name='myorders'),
	path("handlerequest/",handlerequest,name="handlerequest"),
	path("cod.html/",cod,name='cod')
]