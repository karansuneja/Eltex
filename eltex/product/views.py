from django.shortcuts import render
from product.models import Product,Mobile,Tv,Laptop,Watch
from django.conf import settings
from accounts.models import User
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from common import functions 


def product(request,id):
	print(id)
	obj2=Product.objects.get(id=id)
	rev=functions.review(id)  #reviews of the products
	rel=functions.related(id) # related products
	if obj2.category=='mobile':
		obj3=Mobile.objects.get(product_id=id)
		username=functions.get_username(request)
		if username is not None:
			cart_count=functions.cart_count(username)
			category=functions.get_category(username)
			return render(request,'product.html',{'obj':obj2 , 'mobile':obj3 , 'username':username ,'no':cart_count,'category':category,'review':rev,'related':rel} )
		else:
			return render(request,'product.html',{'obj':obj2 , 'mobile':obj3,'review':rev,'related':rel} )
	
	elif obj2.category=='laptop':
		obj3=Laptop.objects.get(product_id=id)
		username=functions.get_username(request)
		if username is not None:
			cart_count=functions.cart_count(username)
			category=functions.get_category(username)
			return render(request,'product.html',{'obj':obj2 , 'laptop':obj3 , 'username':username ,'no':cart_count,'category':category,'review':rev,'related':rel} )
		else:
			return render(request,'product.html',{'obj':obj2 , 'laptop':obj3,'review':rev,'related':rel} )
	
	elif obj2.category=='tv':
		obj3=Tv.objects.get(product_id=id)
		username=functions.get_username(request)
		if username is not None:
			cart_count=functions.cart_count(username)
			category=functions.get_category(username)
			return render(request,'product.html',{'obj':obj2 , 'tv':obj3 , 'username':username ,'no':cart_count,'category':category,'review':rev,'related':rel} )
		else:
			return render(request,'product.html',{'obj':obj2 , 'tv':obj3,'review':rev,'related':rel} )

	elif obj2.category=='watch':
		obj3=Watch.objects.get(product_id=id)
		username=functions.get_username(request)
		if username is not None:
			cart_count=functions.cart_count(username)
			category=functions.get_category(username)
			return render(request,'product.html',{'obj':obj2 , 'watch':obj3 , 'username':username ,'no':cart_count,'category':category,'review':rev,'related':rel} )
		else:
			return render(request,'product.html',{'obj':obj2 , 'watch':obj3,'review':rev,'related':rel} )
	


