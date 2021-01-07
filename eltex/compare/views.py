from django.shortcuts import render, redirect
from compare.models import Compare
from accounts.models import User, User_details
from home.views import home
from cart.models import Cart
from django.http import HttpResponse, HttpResponseRedirect
from product.models import Product, Mobile, Laptop, Tv, Watch
from django.contrib import messages, auth
from common import functions


def addcom(request, id):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        prod = Product.objects.get(id=id)
        if Compare.objects.filter(username=username).exists():
            category = functions.get_category(username)
            if category == prod.category:
                if Compare.objects.filter(username=username, product_id=id).exists():
                    messages.error(request, "product already exist in compare section")
                    return redirect("home")
                else:
                    compare = Compare()
                    compare.username = username
                    compare.product_id = id
                    compare.save()
                    messages.success(request, "Added for compare")
                    return redirect("home")
            else:
                Compare.objects.filter(username=username).delete()
                compare = Compare()
                compare.username = username
                compare.product_id = id
                compare.save()
                messages.success(request, "Added for compare")
                return redirect("home")
        else:
            compare = Compare()
            compare.username = username
            compare.product_id = id
            compare.save()
            messages.success(request, "Added for compare")
            return redirect("home")
    else:
        messages.error(request, "Please login with your account")
        return redirect("home")


# Create your views here.


def compare(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)

        if Compare.objects.filter(username=username).exists():
            product = []
            cart_count = functions.cart_count(username)
            com = Compare.objects.filter(username=username)

            for j in com:
                prod = Product.objects.get(id=j.product_id)
                print(prod)
                product.append(prod)
                category = prod.category
            det = []
            if category == "mobile":
                for n in product:
                    details = Mobile.objects.get(product_id=n.id)
                    det.append(details)
                return render(
                    request,
                    "compare.html",
                    {
                        "username": username,
                        "no": cart_count,
                        "category": category,
                        "mobile": det,
                    },
                )

            elif category == "laptop":
                for n in product:
                    details = Laptop.objects.get(product_id=n.id)
                    det.append(details)
                return render(
                    request,
                    "compare.html",
                    {
                        "username": username,
                        "no": cart_count,
                        "category": category,
                        "laptop": det,
                    },
                )

            elif category == "tv":
                for n in product:
                    details = Tv.objects.get(product_id=n.id)
                    det.append(details)
                return render(
                    request,
                    "compare.html",
                    {
                        "username": username,
                        "no": cart_count,
                        "category": category,
                        "tv": det,
                    },
                )

            elif category == "watch":
                for n in product:
                    details = Watch.objects.get(product_id=n.id)
                    det.append(details)
                return render(
                    request,
                    "compare.html",
                    {
                        "username": username,
                        "no": cart_count,
                        "category": category,
                        "watch": det,
                    },
                )

        else:
            messages.error(request, "Add some products to Compare")
            return redirect("home")
    else:
        messages.error(request, "Please login with your account")
        return redirect("home")


def clear(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
    Compare.objects.filter(username=username).delete()
    return redirect("home")
