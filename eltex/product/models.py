import os
from django.conf import settings
from django.db import models
from datetime import datetime
from seller.models import Seller
from django.utils.safestring import mark_safe

class Product(models.Model):
    id=models.AutoField(primary_key=True)
    seller = models.ForeignKey(Seller,on_delete=models.DO_NOTHING)
    name=models.CharField(max_length=200,blank=False)
    brand=models.CharField(max_length=200,blank=False)
    title = models.CharField(max_length = 100,blank =False)
    price= models.IntegerField(blank=False)
    rating=models.IntegerField(blank=True)
    category=models.CharField(max_length=50,blank=False)
    photo = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =False)
    photo_1 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =False)
    photo_2 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =False)
    photo_3 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =True)
    photo_4 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =True)
    photo_5 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =True)
    photo_6 = models.ImageField(upload_to= 'photos/%y/%m/%d',blank =True)
    stock=models.IntegerField(blank=False)
    launch_date = models.DateTimeField(default=datetime.now,blank=False)
    is_done=models.BooleanField(default=False)
    is_exclusive = models.BooleanField(default = False)
    class meta:
        db_table = 'products'


    def url(self):
        return os.path.join('/','photos/%y/%m/%d',self.photo.url)


    def photo_tag(self):
        return mark_safe('<img src = "{}" width="80" height="80" />'.format(self.url()))
    photo_tag.short_description = 'photo'


    def __str__(self):
        return self.name

class Mobile(models.Model):
    id=models.AutoField(primary_key=True)
    product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
    name=models.CharField(max_length=200,blank=False)
    brand=models.CharField(max_length=200,blank=False)
    display=models.CharField(max_length=200,blank=False)
    rear_camera=models.CharField(max_length=200,blank=False)
    front_camera=models.CharField(max_length=200,blank=False)
    processor=models.CharField(max_length=200,blank=False)
    and_ver=models.CharField(max_length=200,blank=False)
    battery=models.CharField(max_length=200,blank=False)
    warranty=models.CharField(max_length=200,blank=False)
    ram=models.CharField(max_length=200,blank=False)
    rom=models.CharField(max_length=200,blank=False)
    price=models.IntegerField(blank=False)

    class meta:
        db_table='mobile'

    def __str__(self):
        return self.name

class Laptop(models.Model):
    id=models.AutoField(primary_key=True)
    product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
    name=models.CharField(max_length=200,blank=False)
    brand=models.CharField(max_length=200,blank=False)
    ssd=models.CharField(max_length=200,blank=False)
    ram=models.CharField(max_length=200,blank=False)
    hdd=models.CharField(max_length=200,blank=False)
    graphic_card=models.CharField(max_length=200,blank=False)
    processor=models.CharField(max_length=200,blank=False)
    graphic_memory=models.CharField(max_length=200,blank=False)
    warranty=models.CharField(max_length=200,blank=False)
    price=models.IntegerField(blank=False)

    class meta:
        db_table='laptop'

class Tv(models.Model):
    id=models.AutoField(primary_key=True)
    product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
    name=models.CharField(max_length=200,blank=False)
    brand=models.CharField(max_length=200,blank=False)
    dimensions=models.CharField(max_length=200,blank=False)
    display=models.CharField(max_length=200,blank=False)
    hdmi=models.IntegerField(blank=False)
    usb=models.IntegerField(blank=False)
    sound_output=models.CharField(max_length=200,blank=False)
    smart_tv=models.BooleanField(default=False)
    build_in_wifi=models.BooleanField(default=False)
    youtube_support=models.BooleanField(default=False)
    netflix_support=models.BooleanField(default=False)
    refresh_rate=models.CharField(max_length=200,blank=False)
    tv_type=models.CharField(max_length=200,blank=False)
    warranty=models.CharField(max_length=200,blank=False)
    price=models.IntegerField(blank=False)

    class meta:
        db_table='tv'

    def __str__(self):
        return self.name

class Watch(models.Model):
    id=models.AutoField(primary_key=True)
    product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
    name=models.CharField(max_length=200,blank=False)
    brand=models.CharField(max_length=200,blank=False)
    dial_shape=models.CharField(max_length=200,blank=False)
    water_resistance=models.BooleanField(default=False)
    strap_material=models.CharField(max_length=200,blank=False)
    dimensions=models.CharField(max_length=200,blank=False)
    charge_time=models.CharField(max_length=200,blank=False)
    battery_life=models.CharField(max_length=200,blank=False)
    call_function=models.CharField(max_length=200,blank=False)
    wifi=models.BooleanField(default=False)
    gps=models.BooleanField(default=False)
    sensor=models.CharField(max_length=200,blank=False)
    price=models.IntegerField(blank=False)

    class meta:
        db_table='watch'

    def __str__(self):
        return self.name
# Create your models here.
