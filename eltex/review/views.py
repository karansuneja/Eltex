from django.shortcuts import render,redirect
from . models import Review
from product.models import Product
from django.conf import settings
from accounts.models import User
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from product.views import product
from django.contrib import messages,auth
from home.views import home

def review(request,id):
	review=Review()
	review.product_id_id=id
	review.name=request.POST['name']
	review.rating=request.POST['rating']
	review.message=request.POST['message']
	review.save()
	messages.success(request,'Thanks for your review...')
	return redirect('product',id=id)
# Create your views here.
