from django.db import models


class User(models.Model):
	id=models.AutoField( primary_key=True)
	username=models.CharField(max_length=250,blank=False)
	phone=models.CharField(max_length=250, blank=False)
	email=models.CharField(max_length=250,blank=False)
	password=models.CharField(max_length=250,blank=False)
	status=models.CharField(max_length=250, default="inactive" )
	logined=models.BooleanField(default=False)

	class meta:
		db_table='user'

class User_details(models.Model):
	user=models.ForeignKey(User,related_name='user1',on_delete=models.PROTECT)
	f_name=models.CharField(max_length=250,blank=False)
	l_name=models.CharField(max_length=250,blank=False)
	address_type=models.CharField(max_length=250,blank=False,default="home")
	address=models.CharField(max_length=250,blank=False)
	country=models.CharField(max_length=250,blank=False)
	state=models.CharField(max_length=250,blank=False)
	city=models.CharField(max_length=250,blank=False)
	pin=models.CharField(max_length=250,blank=False,default="NULL")
	landmark=models.CharField(max_length=250,blank=False)
	alternate_phone=models.CharField(max_length=250 ,blank=False)

	class meta:
		db_table='user_details'
# Create your models here.
