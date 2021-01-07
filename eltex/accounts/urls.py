from django.contrib import admin
from django.urls import path
from accounts.views import account,create,login,logout,details,details1,show_details

urlpatterns = [
    path("account.html/",account,name='account'),
    path('register.html/',create,name='register'),
    path('myaccount.html/',login,name='login'),
    path('details.html/',details,name='details'),
    path('details1.html/',details1,name='details1'),
    path('details2.html/',show_details,name="show_details"),
    path('logout/',logout,name='logout'),
]
