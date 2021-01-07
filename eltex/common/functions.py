from django.shortcuts import render, redirect
from django.contrib import messages, auth
from review.models import Review
from accounts.models import User
from compare.models import Compare
from cart.models import Cart
from product.models import *
import random


def review(id):
    if Review.objects.filter(product_id_id=id).exists():
        rev = Review.objects.filter(product_id_id=id)
        obje = []
        j = 0
        if len(rev)<=3:
            return rev
        else:
            while j < 3:
                obj1 = random.choice(rev)
                temp = 1
                for i in range(0, j):
                    ob = obje[i]
                    if obj1.id == ob.id:
                        temp = 0
                        break
                if temp == 1:
                    obje.append(obj1)
                    j += 1
            return obje


def related(id):
    rel = Product.objects.get(id=id)
    cat = rel.category
    products = Product.objects.filter(category=cat)
    prod = []
    obje = []
    j = 0
    if len(products)<=3:
        return products
    else:
        while j < 3:
            obj1 = random.choice(products)
            temp = 1
            for i in range(0, j):
                ob = obje[i]
                if obj1.id == ob.id:
                    temp = 0
                    break
            if temp == 1:
                obje.append(obj1)
                j += 1
        return obje


def get_username(request):
    if request.session.has_key("username"):
        username = request.session["username"]
        return username
    else:
        return None


def cart_count(username):
    obj = Cart.objects.filter(username=username)
    return obj.count()


def get_category(username):
    if Compare.objects.filter(username=username).exists():
        com = Compare.objects.filter(username=username)
        for j in com:
            prod = Product.objects.get(id=j.product_id)
            return prod.category
    else:
        return None



def no_to_words(no):
    inp=no
    leng = len(inp)
    p = 9-leng
    raw = "0"*p+inp
    x = len(raw)

    base = {
        "1": "one",
        "2": "two",
        "3": "three",
        "4": "four",
        "5": "five",
        "6": "six",
        "7": "seven",
        "8": "eight",
        "9": "nine"
    }
    tens = {
        "1": "ten",
        "2": "twenty",
        "3": "thirty",
        "4": "fourty",
        "5": "fifty",
        "6": "sixty",
        "7": "seventy",
        "8": "eighty",
        "9": "ninety"
    }
    eles = {
        "1": "eleven",
        "2": "twelve",
        "3": "thirteen",
        "4": "fourteen",
        "5": "fifeteen",
        "6": "sixteen",
        "7": "seventeen",
        "8": "eighteen",
        "9": "nineteen"
    }

    if leng > 9 and leng < 5:
        print("number must be between 5 to 9 digits")
    else:
        if raw[8] == "0" and raw[7] != "0":
            firsttwo = tens[raw[7]]
        elif raw[7] == "1":
            firsttwo = eles[raw[8]]
        elif raw[8] != "0" and raw[7] != "0":
            firsttwo = tens[raw[7]]+" "+base[raw[8]]
        elif raw[8] != "0" and raw[7] == "0":
            firsttwo = base[raw[8]]
        elif raw[8] == "0" and raw[7] == "0":
            firsttwo = ""*0
        if raw[6] == "0":
            hund = ""*0
        else:
            hund = base[raw[6]]+" "+"hundred"

        if raw[5] != "0" and raw[4] == "0":
            thou = base[raw[5]]+" "+"thousand"
        elif raw[4] == "1":
            thou = eles[raw[5]]+" "+"thousand"
        elif raw[5] == "0" and raw[4] != "0":
            thou = tens[raw[4]]+" "+"thousand"
        elif raw[5] != "0" and raw[4] != "0":
            thou = tens[raw[4]]+" "+base[raw[5]]+" "+"thousand"
        elif raw[5] == "0" and raw[4] == "0":
            thou = ""*0

        if raw[3] != "0" and raw[2] == "0":
            lakh = base[raw[3]]+" "+"lakh"
        elif raw[2] == "1":
            lakh = eles[raw[3]]+" "+"lakh"
        elif raw[3] == "0" and raw[2] != "0":
            lakh = tens[raw[2]]+" "+"lakh"
        elif raw[3] != "0" and raw[2] != "0":
            lakh = tens[raw[2]]+" "+base[raw[3]]+" "+"lakh"
        elif raw[3] == "0" and raw[2] == "0":
            lakh = ""*0

        if raw[1] != "0" and raw[0] == "0":
            crore = base[raw[1]]+" "+"crore"
        elif raw[0] == "1":
            crore = eles[raw[1]]+" "+"crore"
        elif raw[1] == "0" and raw[0] != "0":
            crore = tens[raw[0]]+" "+"crore"
        elif raw[1] != "0" and raw[0] != "0":
            crore = tens[raw[0]]+" "+base[raw[1]]+" "+"crore"
        elif raw[1] == "0" and raw[0] == "0":
            crore = ""*0

    final = crore+" "+lakh+" "+thou+" "+hund+" "+firsttwo
    return final
