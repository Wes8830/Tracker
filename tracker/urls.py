from django.urls import path, re_path
from . import views
from users import views as user

urlpatterns = [
    path("index/", views.index, name="index"),
    
    # API Routes
    path("tracker_dashboard/<str:board>/<str:search>/", views.tracker_dashboard, name="board"),
    path("tracker_dashboard/<str:board>/<str:search>/<str:search_value>", views.tracker_dashboard, name="search_board"),
    path("tracker_dashboard/<str:client_id>", views.tracker_dashboard, name="client"),
    path("product_view/<str:product_id>", views.product_view, name="product"),
    path("client_view/<str:client_id>", views.client_view, name="client_view"),
    path("usecase_view/<str:usecase_id>", views.usecase_view, name="usecase"),
    path("create_product", views.create_product, name="create_product"),
    path("create_client", views.create_client, name="create_client"),
    path("create_usecase", views.create_usecase, name="create_usecase"),
    path("get_status/<str:board>", views.get_status, name="get_status"),
    path("delete_product", views.delete_product, name="delete_product"),
    path("delete_client", views.delete_client, name="delete_client"),
    path("delete_usecase", views.delete_usecase, name="delete_usecase"),
    path("logout", user.logout_user, name="logout"),
    path("add/form", views.add_form, name='add_form'),
]