from django.db import models
from accounts.models import User
from datetime import datetime
from product.models import Product

class Orders(models.Model):
	id=models.AutoField(primary_key=True)
	user= models.ForeignKey(User,on_delete=models.DO_NOTHING)
	product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
	price= models.IntegerField(blank=False)
	orderon= models.DateTimeField(default=datetime.now,blank=False)
	payement_id=models.CharField(max_length=250,default="COD")
	delivered=models.BooleanField(default=False)
	class meta:
		db_table ='orders'


class Payement(models.Model):
	id=models.CharField(max_length=250,primary_key=True)
	user= models.ForeignKey(User,on_delete=models.DO_NOTHING)
	products=models.CharField(max_length=250,blank=False)
	amount=models.IntegerField(blank=False)
	status=models.CharField(max_length=250,default="Fail")
	date= models.DateTimeField(default=datetime.now,blank=False)
	class meta:
		db_table='payement'
