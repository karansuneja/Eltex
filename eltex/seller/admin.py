from django.contrib import admin
from .models import Seller

# Register your models here.
class SellersAdmin(admin.ModelAdmin):
    list_display = ('id','name','seller_of_the_month')
    list_display_links = ('id','name',)
    list_filter = ('name',)
    list_editable = ('seller_of_the_month',)
    search_fields = ('name','joindate','phone','email')
    list_per_page = 50

admin.site.register(Seller,SellersAdmin)
# Register your models here.
