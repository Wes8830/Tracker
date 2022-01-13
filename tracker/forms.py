from django.forms import ModelForm
from .models import Client, Product, UseCase

class ProductForm(ModelForm):
    class Meta:
        model = Product
        fields = ['product', 'desc', 'status']

class ClientForm(ModelForm):
    class Meta:
        model = Client
        fields = ['client', 'desc', 'link', 'notes']

class UseCaseForm(ModelForm):
    class Meta:
        model = UseCase
        fields = ['use_case', 'desc', 'status']