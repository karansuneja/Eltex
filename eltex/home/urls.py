from django.contrib import admin
from django.urls import path
from home.views import home,contact,mobile,laptop,tv,watch,contactus,terms,privacy,aboutus

urlpatterns = [
	path('index.html/',home,name='home'),
    path('contact.html/',contact,name='contact'),
    path('terms.html/',terms,name='terms'),
    path('privacy.html/',privacy,name='privacy'),
    path('aboutus.html/',aboutus,name='aboutus'),
    path('category.html/',mobile,name='mobile'),
    path('category1.html/',laptop,name='laptop'),
    path('category2.html/',tv,name='tv'),
    path('category3.html/',watch,name='watch'),
    path('contactus.html/',contactus,name='contactus'),
    path('',home,name='home')
   
]
