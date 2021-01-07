from django.db import models

class Contact(models.Model):
	id=models.AutoField( primary_key=True)
	name=models.CharField(max_length=250,blank=False)
	email=models.EmailField(max_length=250,blank=False)
	phone=models.CharField(max_length=250, blank=False)
	message=models.TextField(blank=False)

	class meta:
		db_table='user'

# Create your models here.
