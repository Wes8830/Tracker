from django.contrib import admin

from users.models import User
from .models import Client, Product, Component, UseCase, UserStory, Product_UseCase, Product_Component, Client_Product, Client_UseCase

# Register your models here.
admin.site.register(User)

admin.site.register(Client)
admin.site.register(Product)
# admin.site.register(Component)
admin.site.register(UseCase)
# admin.site.register(UserStory)
# admin.site.register(Product_UseCase)
# admin.site.register(Product_Component)
# admin.site.register(Client_Product)
# admin.site.register(Client_UseCase)


