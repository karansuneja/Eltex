from django.shortcuts import render
from django.shortcuts import render,redirect
from django.conf import settings 
from django.http import HttpResponse, HttpResponseRedirect
from django.core.mail import BadHeaderError, send_mail
import random
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from django.contrib import messages,auth
from home.views import home
from accounts.views import account
from accounts.views import show_details
from product.models import Product,Mobile
from accounts.models import User,User_details
from common import functions

def search(request):
	if request.method=='POST':
		username=functions.get_username(request)
		if username is not None:
			user=User.objects.get(username=username)
			id=user.id
			if User_details.objects.filter(user_id=id).exists():
				details=User_details.objects.get(user_id=id)
				cart_count=functions.cart_count(username)
				category=functions.get_category(username)
				cat=request.POST['type']
				brand=request.POST['brand']
				start=request.POST['from']
				to=request.POST['to']
				if cat=='Null':
					products=Product.objects.filter(brand=brand)
				elif brand=='Null':
					products=Product.objects.filter(category=cat)
				else:
					products=Product.objects.filter(brand=brand,category=cat)
			
				product=[]
				for item in products:
					if item.price>=int(start) and item.price<=int(to):
						product.append(item)
				if product:
					return render(request,'search.html',{'obj':product,'username':username , 'no':cart_count , 'user':id ,'details':details ,'category':category})
				else:
					messages.error(request,'No products available')
					return redirect('home')

		else:
			cat=request.POST['type']
			brand=request.POST['brand']
			start=request.POST['from']
			to=request.POST['to']
			if cat=='Null':
				products=Product.objects.filter(brand=brand)
			elif brand=='Null':
				products=Product.objects.filter(category=cat)
			else:
				products=Product.objects.filter(brand=brand,category=cat)
			
			product=[]
			for item in products:
				if item.price>=int(start) and item.price<=int(to):
					product.append(item)
			if product:
				return render(request,'search.html',{'obj':product})
			else:
				messages.error(request,'No products available')
				return redirect('home')
# Create your views here.
