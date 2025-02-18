"""
URL configuration for ward_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    # Admin Route (unchanged)
    path("admin/", admin.site.urls),

    # User Routes (new additions)
    path("signup/", views.signup, name="signup"),
    path("login/", views.user_login, name="login"),
    path("logout/", views.user_logout, name="logout"),
    path("dashboard/", views.dashboard, name="dashboard"),

    # Resident Routes
    path("add/", views.add_resident, name="add_resident"),
    path("edit/<int:resident_id>/", views.edit_resident, name="edit_resident"),
    path("delete/<int:resident_id>/", views.delete_resident, name="delete_resident"),

    # Search Route (modified)
    path("search/", views.search, name="search"),
    
    # Resident Detail (if needed, otherwise replace with edit)
    # path("<int:resident_id>/", views.resident_detail, name="resident_detail"),
]
