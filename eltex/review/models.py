from django.db import models
from product.models import Product
from datetime import datetime


class Review(models.Model):
	id=models.AutoField(primary_key=True)
	product_id=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
	name=models.CharField(max_length=250,blank=False)
	rating=models.IntegerField(blank=False)
	message=models.CharField(max_length=250,blank=False)
	date = models.DateTimeField(default=datetime.now,blank=False)
	class meta:
		db_table = 'review'


# Create your models here.
