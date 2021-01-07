from django.contrib import admin
from . models import Review


class ReviewAdmin(admin.ModelAdmin):
    list_display = ('id','name','product_id','rating','message')
    list_display_links = ('id','name',)


admin.site.register(Review,ReviewAdmin)
# Register your models here.
