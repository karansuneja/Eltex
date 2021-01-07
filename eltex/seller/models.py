from django.db import models
from datetime import datetime

#Create your models here.
class Seller(models.Model):
	id=models.AutoField(primary_key=True)
	#unique_id=models.CharField(max_length=200,blank=False)
	name=models.CharField(max_length=200,blank=False)
	photo=models.ImageField(upload_to='seller/%y/%m/%d',blank=False)
	phone=models.CharField(max_length=10,blank=False)
	email=models.EmailField(max_length=50,blank=False)
	country=models.CharField(max_length=100,blank=False)
	city=models.CharField(max_length=100,blank=False)
	address=models.TextField(blank=False)
	joindate=models.DateTimeField(blank=True, default=datetime.now)
	seller_of_the_month = models.BooleanField(default=False)
    #is_mvp = models.BooleanField(default=False)
	def __str__(self):
		return self.name
# Create your models here.
