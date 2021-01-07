from django.shortcuts import render, redirect
from django.conf import settings
from accounts.forms import Userform, Detailsform
from accounts.models import User, User_details
from django.http import HttpResponse, HttpResponseRedirect
from django.core.mail import BadHeaderError, send_mail
import random
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password
from cart.models import Cart
from compare.models import Compare
from product.models import Product
from django.contrib import messages, auth
from home.views import home
from accounts.views import account
from accounts.views import show_details
from product.models import Product, Mobile
from .models import Orders, Payement
from django.views.decorators.csrf import csrf_exempt
from paytm import Checksum
from datetime import date
import time

MERCHANT_KEY = "" #ADD YOUR MERCHANT KEY HERE
from common import functions


def checkout(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        if user.status == "active":
            product = []
            if Cart.objects.filter(username=username).exists():
                cart = Cart.objects.filter(username=username)
                cart_count = functions.cart_count(username)
                for item in cart:
                    prod = Product.objects.get(id=item.product_id)
                    product.append(prod)
                    total = 0
                    for i in product:
                        price = i.price
                        total = total + price
                total_in_words=functions.no_to_words(str(total))
                details = User_details.objects.get(user_id=id)
                category = functions.get_category(username)
                return render(
                    request,
                    "checkout.html",
                    {
                        "cart": product,
                        "username": username,
                        "no": cart_count,
                        "total": total,
                        "total_in_words":total_in_words,
                        "details": details,
                        "user": user,
                        "category":category,
                    },
                )
            else:
                messages.error(request, "add some products to the cart for checkout")
                return redirect("home")
        else:
            messages.error(request, "please fill you details first and then checkout")
            return redirect("show_details")
    else:
        messages.error(request, "login with your account")
        return redirect("account")


def cod(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        product = []
        cart = Cart.objects.filter(username=username)
        for item in cart:
            orde = Orders()
            prod = Product.objects.get(id=item.product_id)
            orde.user_id = user.id
            orde.product_id = prod.id
            orde.price = prod.price
            orde.save()
        messages.success(request, "your order has been placed")
        Cart.objects.filter(username=username).delete()
        return redirect("home")


def confirm(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        email = user.email
        product = []
        cart = Cart.objects.filter(username=username)
        cart_count = functions.cart_count(username)
        for item in cart:
            prod = Product.objects.get(id=item.product_id)
            product.append(prod)
            total = 0
            for i in product:
                price = i.price
                total = total + price
        prod_id = " "
        prod_id = str(prod_id)
        for item in cart:
            prod = Product.objects.get(id=item.product_id)
            produ = str(prod.id)
            prod_id = prod_id + produ
            prod_id = prod_id + ","
        user_id = str(user.id)
        today = date.today()
        year = str(today.year)
        month = str(today.month)
        day = str(today.day)
        t = time.localtime()
        current_time = time.strftime("%H%M%S", t)
        pay_id = day + month + year + current_time + "_" + user_id
        # for payement table
        pay = Payement()
        pay.id = pay_id
        pay.user_id = user.id
        pay.products = prod_id
        pay.amount = total
        pay.save()
        payeeee=Payement.objects.get(id=pay_id)
        print(payeeee)
        param_dict = {
            "MID": "",
            "ORDER_ID": str(pay_id),
            "TXN_AMOUNT": str(total),
            "CUST_ID": email,
            "INDUSTRY_TYPE_ID": "Retail",
            "WEBSITE": "WEBSTAGING",
            "CHANNEL_ID": "WEB",
            "CALLBACK_URL": "http://127.0.0.1:8000/handlerequest/",
        }
        param_dict["CHECKSUMHASH"] = Checksum.generate_checksum(
            param_dict, MERCHANT_KEY
        )
        return render(request, "paytm.html", {"param_dict": param_dict})
    return render(request, "shop/checkout.html")


def myorders(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        orders = Orders.objects.filter(user_id=id)
        ordered_products = []
        category = functions.get_category(username)
        for item in orders:
            prod1 = Product.objects.get(id=item.product_id)
            ordered_products.append(prod1)
        return render(
            request,
            "myorders.html",
            {
                "username": username,
                "no": cart_count,
                "product": ordered_products,
                "orders": orders,
                "category": category,
            },
        )


@csrf_exempt
def handlerequest(request):
    # paytm will send you post request here
    form = request.POST
    print(form)
    response_dict = {}
    for i in form.keys():
        response_dict[i] = form[i]
        if i == "CHECKSUMHASH":
            checksum = form[i]

    verify = Checksum.verify_checksum(response_dict, MERCHANT_KEY, checksum)
    if verify:
        if response_dict["RESPCODE"] == "01":
            print("order successful")
            order = form["ORDERID"]
            print(form["ORDERID"])
            user_id_trail = order.index("_")
            user_id = order[user_id_trail + 1 :]
            user = User.objects.get(id=user_id)
            username = user.username
            cart = Cart.objects.filter(username=username)
            for item in cart:
                order = Orders()
                prod = Product.objects.get(id=item.product_id)
                order.user_id = user.id
                order.product_id = prod.id
                order.price = prod.price
                order.payement_id = form["ORDERID"]
                order.save()
            pay_id = form["ORDERID"]
            pay = Payement.objects.get(id=pay_id)
            pay.status = "Success"
            pay.save()
            messages.success(request, "your order has been placed")
            Cart.objects.filter(username=username).delete()
            return redirect("home")
        else:
            messages.error(request, response_dict["RESPMSG"])
            return redirect("home")
            print("order was not successful because" + response_dict["RESPMSG"])
    else:
        messages.error(request, "order is not been placed! Try again!")
        return redirect("home")


# Create your views here.
