from django.db import models
from accounts.models import User
from product.models import Product

class Compare(models.Model):
	id=models.AutoField( primary_key=True)
	username=models.CharField(max_length=250,blank=False)
	product=models.ForeignKey(Product,related_name='comp_prod',on_delete=models.PROTECT)
	

	class meta:
		db_table='compare'
# Create your models here.
