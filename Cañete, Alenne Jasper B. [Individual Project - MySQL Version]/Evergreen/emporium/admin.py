from django.contrib import admin

admin.site.site_header = "Evergeen"
admin.site.index_title = "Emporium Network Authority"

# Register your models here.

from .models import *

admin.site.register(User)
admin.site.register(Persona)
admin.site.register(Item)
admin.site.register(Purchase)
admin.site.register(Order)
admin.site.register(Delivery)