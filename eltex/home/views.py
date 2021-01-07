from django.shortcuts import render, redirect
from product.models import Product, Mobile
from accounts.models import User, User_details
import random
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from .forms import Contactform
from django.contrib import messages, auth
from common import functions


def home(request):
    obj = Product.objects.all()
    exclusive_products = []
    featured_products = []
    j = 0
    # loop to add exclusive products in the list
    while j < 4:
        obj1 = random.choice(obj)
        temp = 1
        for i in range(0, j):
            ob = exclusive_products[i]
            if obj1.id == ob.id:
                temp = 0
                break
        if temp == 1:
            if obj1.is_exclusive:
                exclusive_products.append(obj1)
                j += 1
    # loop to add random four products in the list 
    j = 0
    while j < 4:
        obj1 = random.choice(obj)
        temp = 1
        for i in range(0, j):
            ob = featured_products[i]
            if obj1.id == ob.id:
                temp = 0
                break
        if temp == 1:
            featured_products.append(obj1)
            j += 1
    username = functions.get_username(request)
    if username is not None:
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "index.html",
            {
                "obj": exclusive_products,
                "obj0": featured_products,
                "username": username,
                "no": cart_count,
                "category": category,
            },
        )
    else:
        return render(request, "index.html", {"obj": obje, "obj0": objec})


def contact(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "contact.html",
            {
                "username": username,
                "no": cart_count,
                "user": user,
                "category": category,
            },
        )
    else:
        return render(request, "contact.html")


def mobile(request):
    mobiles = Product.objects.filter(category="mobile")
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "category.html",
            {
                "obj": mobiles,
                "username": username,
                "no": cart_count,
                "category": category,
            },
        )
    else:
        return render(request, "category.html", {"obj": mobiles})


def laptop(request):
    laptops = Product.objects.filter(category="laptop")
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "category.html",
            {
                "obj": laptops,
                "username": username,
                "no": cart_count,
                "category": category,
            },
        )
    else:
        return render(request, "category.html", {"obj": laptops})


def tv(request):
    tvs = Product.objects.filter(category="tv")
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "category.html",
            {"obj": tvs, "username": username, "no": cart_count, "category": category},
        )
    else:
        return render(request, "category.html", {"obj": tvs})


def watch(request):
    watches = Product.objects.filter(category="watch")
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "category.html",
            {
                "obj": watches,
                "username": username,
                "no": cart_count,
                "category": category,
            },
        )
    else:
        return render(request, "category.html", {"obj": watches})


def contactus(request):
    contact = Contactform(request.POST)
    contact.save()
    messages.success(request, "Your message is submitted successfully")
    return redirect("home")


def terms(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "terms.html",
            {
                "username": username,
                "no": cart_count,
                "user": user,
                "category": category,
            },
        )
    else:
        return render(request, "terms.html")


def privacy(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "privacy.html",
            {
                "username": username,
                "no": cart_count,
                "user": user,
                "category": category,
            },
        )
    else:
        return render(request, "privacy.html")


def aboutus(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "aboutus.html",
            {
                "username": username,
                "no": cart_count,
                "user": user,
                "category": category,
            },
        )
    else:
        return render(request, "aboutus.html")
