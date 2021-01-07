from django.shortcuts import render, redirect
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from accounts.models import User, User_details
from home.views import home
from django.http import HttpResponse, HttpResponseRedirect
from product.models import Product, Mobile
from django.contrib import messages, auth
from common import functions

# from order.views import checkout


def addc(request, id):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        cart = Cart()
        cart.username = username
        cart.product_id = id
        cart.save()
        messages.success(request, "Added to cart successfuly")
        return redirect("cart")
    else:
        messages.error(request, "Please login with your account")
        return redirect("home")


def cart(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        product = []
        cart = Cart.objects.filter(username=username)
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        if cart:
            for item in cart:
                prod = Product.objects.get(id=item.product_id)
                product.append(prod)
                total = 0
                for i in product:
                    price = i.price
                    total = total + price
            return render(
                request,
                "cart.html",
                {
                    "cart": product,
                    "username": username,
                    "no": cart_count,
                    "total": total,
                    "category": category,
                },
            )
        else:
            return render(
                request,
                "cart.html",
                {"username": username, "no": cart_count, "category": category},
            )
    else:
        return render(request, "cart.html")


def remove(request, id):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
    Cart.objects.filter(product_id=id, username=username).delete()
    return redirect("cart")

def aj_addc(request):
    username = functions.get_username(request)
    id=request.GET['id']
    user = User.objects.get(username=username)
    cart = Cart()
    cart.username = username
    cart.product_id = id
    try:
        cart.save()
        cart_count=functions.cart_count(username)
        return HttpResponse(cart_count)
    except:
        return HttpResponse('false')


# Create your views here.
