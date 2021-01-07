from django.shortcuts import render, redirect
from django.conf import settings
from .forms import Userform, Detailsform
from .models import User, User_details
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
from common import functions


def account(request):
    return render(request, "account.html")


def create(request):
    user1 = Userform(request.POST)
    username = request.POST.get("username")
    if User.objects.filter(username=username).exists():
        messages.error(request, "Username already exists!")
        return render(request, "account.html")
    else:
        email = request.POST.get("email")
        if User.objects.filter(email=email).exists():
            messages.error(request, "Email already exists!")
            return render(request, "account.html")
        else:
            password = request.POST.get("password")
            password2 = request.POST.get("repassword")
            if password == password2:
                subject="Greetings from Eltex!!"
                from_email=settings.EMAIL_HOST_USER
                to_email=[email]
                print(to_email)
                message="hello "+username+"\nWelcome to the eltex family\n -eltex"
                try:
                    send_mail(subject=subject,from_email=from_email,recipient_list=to_email,message=message)
                except:
                    messages.error(request,"the email is not valid")
                    return redirect('account')
                else:
                    user1.save()
                    messages.success(request,"The User is created.Now you can login with your account")
                    return redirect('account')
                # return render(request,'details.html',{'username':username})
            else:
                messages.error(request, "you must enter the same password")
                return redirect("account")


def login(request):
    if request.method == "POST":
        username = request.POST["usernamee"]
        password = request.POST["passwordd"]
        passw = make_password(password)
        if User.objects.filter(username=username).exists():
            user = User.objects.get(username=username)
            if user.password == password:
                request.session["username"] = username
                request.session.set_expiry(86400)  # experi time in seconds
                user.save()
                if user.status == "inactive":
                    messages.success(request, "You are now logged in")
                    return redirect("details")

                else:
                    messages.success(request, "You are now logged in")
                    return redirect("home")

            else:
                messages.error(request, "invalid password")
                return redirect("account")
        else:
            messages.error(request, "invalid credential")
            return redirect("account")
    else:
        return HttpResponse("error")


def logout(request):
    if request.session.has_key("username"):
        request.session.flush()
        messages.success(request, "You are now logged out")
        return redirect("home")
    else:
        return HttpResponse(" Error! session is out")


def details(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        cart_count = functions.cart_count(username)
        category = functions.get_category(username)
        return render(
            request,
            "details.html",
            {"username": username, "no": cart_count, "user": id, "category": category},
        )
    else:
        return render(request, "index.html")


def details1(request):
    user2 = Detailsform(request.POST)
    id = request.POST.get("user")
    obj = User.objects.get(id=id)
    if User_details.objects.filter(user_id=id).exists():
        details = User_details.objects.get(user_id=id)
        details.f_name = request.POST.get("f_name")
        details.l_name = request.POST.get("l_name")
        details.address = request.POST.get("address")
        details.country = request.POST.get("country")
        details.state = request.POST.get("state")
        details.city = request.POST.get("city")
        details.pin = request.POST.get("pin")
        details.landmark = request.POST.get("landmark")
        details.alternate_phone = request.POST.get("alternate_phone")
        details.save()
    else:
        user2.save()
        obj.status = "active"
        obj.save()
    return redirect("home")


def show_details(request):
    username = functions.get_username(request)
    if username is not None:
        user = User.objects.get(username=username)
        id = user.id
        if User_details.objects.filter(user_id=id).exists():
            details = User_details.objects.get(user_id=id)
            cart_count = functions.cart_count(username)
            category = functions.get_category(username)
            return render(
                request,
                "details.html",
                {
                    "username": username,
                    "no": cart_count,
                    "user": id,
                    "details": details,
                    "category": category,
                },
            )
        else:
            cart_count = functions.cart_count(username)
            category = functions.get_category(username)
            return render(
                request,
                "details.html",
                {
                    "username": username,
                    "no": cart_count,
                    "user": id,
                    "category": category,
                },
            )
    else:
        return render(request, "index.html")
