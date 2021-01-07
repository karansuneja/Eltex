from django.contrib import admin
from .models import Product,Mobile,Laptop,Tv,Watch


class ProductAdmin(admin.ModelAdmin):
    field = ('photo_tag','name','title')
    readonly_fields= ('photo_tag',)
    list_display = ('id','name','stock','price','launch_date','seller','is_exclusive')
    list_display_links = ('id','name',)
    list_filter = ('seller','launch_date','id')
    list_editable = ['is_exclusive']
    search_fields = ('name','title','seller','price')
    #list_per_page = 

class MobileAdmin(admin.ModelAdmin):
	list_display=('id','name','brand','price')
	list_display_links=('id','name')
	list_filter=('brand','price')
	search_fields=('name','brand')

class LaptopAdmin(admin.ModelAdmin):
	list_display=('id','name','brand','price')
	list_display_links=('id','name')
	list_filter=('brand','price')
	search_fields=('name','brand')

class TvAdmin(admin.ModelAdmin):
	list_display=('id','name','brand','price')
	list_display_links=('id','name')
	list_filter=('brand','price')
	search_fields=('name','brand')

class WatchAdmin(admin.ModelAdmin):
	list_display=('id','name','brand','price')
	list_display_links=('id','name')
	list_filter=('brand','price')
	search_fields=('name','brand')



# Register your models here.;
admin.site.register(Product,ProductAdmin)
admin.site.register(Mobile,MobileAdmin)
admin.site.register(Laptop,LaptopAdmin)
admin.site.register(Tv,TvAdmin)
admin.site.register(Watch,WatchAdmin)
# Register your models here.
