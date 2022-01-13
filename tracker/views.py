import json
from django.http import JsonResponse
from django.shortcuts import redirect, render, HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from tracker.forms import ProductForm, ClientForm, UseCaseForm

# Import Models from both applications
from .models import Client, Product, Component, UseCase, UserStory, Product_UseCase, Product_Component, Client_Product, Client_UseCase
from users.models import User


# home with login required decorator (Source: https://docs.djangoproject.com/en/3.2/topics/auth/default/#the-login-required-decorator)
@login_required
def index(request):
    
    # Check for Authentication, if Not logged in, reverse to Login screen.
    if request.user.is_authenticated:
    
        clients = Client.objects.all()
        products = Product.objects.all()
        usecases = UseCase.objects.all()
                  
        return render(request, "index.html", {
            "clients": clients,
            "products": products,
            "usecases": usecases
        })
    else:
        return HttpResponseRedirect(reverse("login"))

# Loads the relevant dashboard for Product, Client, Use Case.
# Also, Searches the relevant dashboard for matches to a query. Searches come in through the Nav Bar's Search form.
def tracker_dashboard(request, board, search_value='', search='False'):
    print(f"{board}")
    if board == "client":
        if search == 'True':
            print(f'Client Query Search Value: {search_value}')
            items = Client.objects.filter(client__icontains=search_value)
        else:
            items = Client.objects.all()
    elif board == "product":
        if search == 'True':
            items = Product.objects.filter(product__icontains=search_value)
        else: 
            items = Product.objects.all()
    elif board == "usecase":
        if search == 'True':
            items = UseCase.objects.filter(use_case__icontains=search_value)
        else: 
            items = UseCase.objects.all()
    else:
        return JsonResponse({"error": "Invalid board."}, status=400)

    # items = list(items)
    print(f'Items object is: ${items}')

    return JsonResponse({
        "items": [item.serialize() for item in items]
    }, safe=False)


# Gets 'Status' field class choices from relevant Models
def get_status(request, board):
        if board == 'product':
            status_choices = Product._meta.get_field('status').choices
        elif board == 'usecase':
            status_choices = UseCase._meta.get_field('status').choices
        
        statuses = []
        # Unpack the List of tuples, grab value you need, repack into a List for delivery to Front End
        for tuple in status_choices:
            name, item = tuple
            print(name)
            statuses.append(name)

        print(statuses)

        return JsonResponse({"statuses":statuses}, safe=False, status=200, )


# View individual Product page
def product_view(request, product_id):
    item = Product.objects.get(id=product_id)

    print(f'item is {item}')

    return JsonResponse({
        "item": item.serialize()
    }, safe=False)

# View individual Client page
def client_view(request, client_id):
    
    item = Client.objects.get(id=client_id)

    print(f'item is {item}')

    return JsonResponse({
        "item": item.serialize()
    }, safe=False)

# View individual Use Case page
def usecase_view(request, usecase_id):
    print('UseCase View!')
    item = UseCase.objects.get(id=usecase_id)

    print(f'item is {item}')

    return JsonResponse({
        "item": item.serialize()
    }, safe=False)


# Creates & Edits Product object
@csrf_exempt
@login_required
def create_product(request):
    print('Youre in Create Product')
    if request.method != 'POST':
        return JsonResponse({"error": "POST request required."}, status=400)
    
    user = User.objects.get(username=request.user)
    payload = json.loads(request.body)
    pay=payload['item_id']
    print(f'Payload is: {pay}')
 
    if payload['item_id'] != 'none':
        Product.objects.filter(id=payload['item_id']).update(
            product=payload['product'], 
            desc=payload['desc'],
            status=payload['status']
        )
    else:
        obj, created = Product.objects.get_or_create(
            author=user,
            product=payload['product'],
            desc=payload['desc'],
            status=payload['status']
        )

    return JsonResponse("success", status=200, safe=False)

# Creates & Edits Client object
@csrf_exempt
@login_required
def create_client(request):
    if request.method != 'POST':
        return JsonResponse({"error": "POST request required."}, status=400)
    
    user = User.objects.get(username=request.user)
    payload = json.loads(request.body)
    print(payload['client'])

    if payload['item_id'] != 'none':
        Client.objects.filter(id=payload['item_id']).update(
            client=payload['client'], 
            desc=payload['desc'],
            link=payload['link']
        )
    else:
        obj, created = Client.objects.get_or_create(
            author=user,
            client=payload['client'],
            desc=payload['desc'],
            link=payload['link']
        )

    return JsonResponse("success", status=200, safe=False)


# Creates & Edits Use Case object
@csrf_exempt
@login_required
def create_usecase(request):
    if request.method != 'POST':
        return JsonResponse({"error": "POST request required."}, status=400)
    
    user = User.objects.get(username=request.user)
    payload = json.loads(request.body)
    print(payload['usecase'])

    if payload['item_id'] != 'none':
      obj = UseCase.objects.filter(id=payload['item_id']).update(
            use_case=payload['usecase'], 
            desc=payload['desc'],
            status=payload['status']
        )
    else:
        obj, created = UseCase.objects.get_or_create(
            author=user,
            use_case=payload['usecase'],
            desc=payload['desc'],
            status=payload['status']
        )
    
    print(f'obj id is: {obj}')

    # The below reverse is returning a 304 error.
    return JsonResponse("success", status=200, safe=False)


# Deletes Product object
@csrf_exempt
@login_required
def delete_product(request):
    print('DELETING')
    
    # load the JSON request body
    payload = json.loads(request.body)
    prod_id = payload['id']

    # delete the record from database
    Product.objects.get(id=prod_id).delete()

    print(f'Deleted Product {prod_id}')
    return JsonResponse("success", status=200, safe=False)


# Deletes Client object
@csrf_exempt
@login_required
def delete_client(request):
    # load the JSON request body
    payload = json.loads(request.body)
    client_id = payload['id']

    # delete the record from database
    Client.objects.get(id=client_id).delete()

    print(f'Deleted Product {client_id}')
    return JsonResponse("success", status=200, safe=False)


# Deletes Use Case object
@csrf_exempt
@login_required
def delete_usecase(request):
    # load the JSON request body
    payload = json.loads(request.body)
    usecase_id = payload['id']

    # delete the record from database
    UseCase.objects.get(id=usecase_id).delete()

    print(f'Deleted Product {usecase_id}')
    return JsonResponse("success", status=200, safe=False)

# https://www.youtube.com/watch?v=L6y6cn1XUfw - for CKEditor implementation instructions
def productForm(request):
    if request.method == 'POST':
        form = ProductForm(request.POST)
        if form.is_valid():
            post_item = form.save(commit=False)
            post_item.save()
            return redirect('')
    else:
        form = ProductForm()
    return render(request, 'form.html', {'form': form})

def clientForm(request):
    if request.method == 'POST':
        form = ClientForm(request.POST)
        if form.is_valid():
            post_item = form.save(commit=False)
            post_item.save()
            return redirect('')
    else:
        form = ClientForm()
    return render(request, 'form.html', {'form': form})

def usecaseForm(request):
    if request.method == 'POST':
        form = UseCaseForm(request.POST)
        if form.is_valid():
            post_item = form.save(commit=False)
            post_item.save()
            return redirect('')
    else:
        form = UseCaseForm()
    return render(request, 'form.html', {'form': form})