from django.urls import reverse
from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from .models import User


# Create your views here.

# You'll create these views for logging in a user and logging them out

def login(request):
        
    # sign user in 
    # Source: https://docs.djangoproject.com/en/3.2/topics/auth/default/#auth-web-requests
    if request.method == 'POST':
        username = request.POST["username"]
        print(f"username: {username}")
        password = request.POST["password"]
        print(f"password: {password}")
        user = authenticate(request, username=username, password=password)
        print(f"user: {user}")

        # sign user in if authenticate was successful 
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else: 
            return render(request, 'registration/login.html')
    elif request.user.is_authenticated:
        return HttpResponseRedirect(reverse("index"))
    else:
        return render(request,'registration/login.html')

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        check_password = request.POST['check_password']
        print(f"username: {username}, email: {email}, pw1: {password}, pw2: {check_password}")

        if username and email and password:
            if password != check_password:
                return HttpResponse("passwords do not match")
            user = User.objects.create_user(username, email, password)
            if user is not None:
                return render(request, 'registration/register.html', {
                "message": "you have successfully registered your account" 
                })
            else: 
                return render(request, 'registration/register.html', {
                    "message": "Oops, something went wrong or the values entered are inaccurate."
                })
        else: 
            return HttpResponse("Your register request is invalid. Please fill out the required fields.")

    return render(request, 'registration/register.html')

def logout_user(request):
    logout(request)        
    return render(request, 'registration/logged_out.html')
    
    # return HttpResponse("<h2>You have succesfully Logged Out.</h2><br><h3>Thank you</h3>")