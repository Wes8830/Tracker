from django.urls import include, path
from django.contrib.auth import views as auth_views

from . import views
from tracker import views as tracker

urlpatterns = [
    path("", views.login, name="login"),
    path('accounts/', include('django.contrib.auth.urls')),
    path('logout/', views.logout_user, name='logout'),
    path("index", tracker.index, name="index"),
    path("register", views.register, name="register")
]