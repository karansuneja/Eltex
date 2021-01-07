from django.forms import ModelForm
from .models import User,User_details

class Userform(ModelForm):
	class Meta:
		model=User
		fields=('username','phone','email','password','status')

class Detailsform(ModelForm):
	class Meta:
		model=User_details
		fields=('user','f_name','l_name','address','country','state','city','landmark','alternate_phone')