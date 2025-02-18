from django.shortcuts import render, get_object_or_404, redirect
from .models import Resident
from django.db.models import Q
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

# User Signup
def signup(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        role = request.POST["role"]  # 'admin' or 'member'

        user = User.objects.create_user(username=username, password=password)
        user.save()

        if role == "admin":
            user.is_staff = True  # Only one admin (set manually)
        else:
            user.is_staff = False  # Regular member

        user.save()
        return redirect("login")

    return render(request, "signup.html")


# User Login
def user_login(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            return redirect("dashboard")
        else:
            return HttpResponse("Invalid username or password")
    
    return render(request, "login.html")

# User Logout
def user_logout(request):
    logout(request)
    return redirect("login")

# Dashboard (shows only user's data)
@login_required
def dashboard(request):
    if request.user.is_staff:  # Admin sees all residents
        residents = Resident.objects.all()
    else:  # Regular users see only their data
        residents = Resident.objects.filter(user=request.user)
    
    return render(request, "dashboard.html", {"residents": residents})

# Add a new resident (only for members)
@login_required
def add_resident(request):
    if request.method == "POST":
        name = request.POST.get("name")
        age = request.POST.get("age")
        house_no = request.POST.get("house_no")
        occupation = request.POST.get("occupation")
        business = request.POST.get("business", "")
        no_of_children = request.POST.get("no_of_children")

        Resident.objects.create(
            user=request.user,  # Assign resident to logged-in user
            name=name,
            age=age,
            house_no=house_no,
            occupation=occupation,
            business=business,
            no_of_children=no_of_children
        )

        return redirect("dashboard")

    return render(request, "add_resident.html")

# Edit Resident (Only Owner or Admin)
@login_required
def edit_resident(request, resident_id):
    resident = get_object_or_404(Resident, id=resident_id)

    if request.user != resident.user and not request.user.is_staff:
        return HttpResponse("You are not authorized to edit this resident.")

    if request.method == "POST":
        resident.name = request.POST.get("name")
        resident.age = request.POST.get("age")
        resident.house_no = request.POST.get("house_no")
        resident.occupation = request.POST.get("occupation")
        resident.business = request.POST.get("business", "")
        resident.no_of_children = request.POST.get("no_of_children")
        resident.save()

        return redirect("dashboard")

    return render(request, "edit_resident.html", {"resident": resident})

# Delete Resident (Only Admin)
@login_required
def delete_resident(request, resident_id):
    resident = get_object_or_404(Resident, id=resident_id)

    if not request.user.is_staff:
        return HttpResponse("Only the admin can delete residents.")

    resident.delete()
    return redirect("dashboard")

@login_required
def search(request):
    query = request.GET.get("q", "")
    
    if request.user.is_staff:
        residents = Resident.objects.all()  # Admin sees all residents
    else:
        residents = Resident.objects.filter(user=request.user)  # Regular user sees only their data
    
    if query:
        residents = residents.filter(
            Q(name__icontains=query) | Q(house_no__icontains=query) |
            Q(occupation__icontains=query) | Q(business__icontains=query)
        )

    return render(request, "search.html", {"residents": residents, "query": query})


""" ~~~~~~~~~~~~~~~~~this is old code~~~~~~~~~~~~~~~~~

# Search functionality
def search(request):
    query = request.GET.get("q", "")  # Default to empty string if no query is provided
    residents = Resident.objects.all()
    
    if query:  # Executes filter if query is provided
        residents = residents.filter(
            Q(name__icontains=query) |  # Case-insensitive search
            Q(occupation__icontains=query) |
            Q(business__icontains=query) |
            Q(house_no__icontains=query)
        )
    
    return render(request, "residents/search.html", {"residents": residents, "query": query})

# Display details of a single resident
def resident_detail(request, resident_id):
    resident = get_object_or_404(Resident, id=resident_id)
    return render(request, "residents/detail.html", {"resident": resident})

# Delete a resident
def delete_resident(request, resident_id):
    resident = get_object_or_404(Resident, id=resident_id)
    resident.delete()
    return redirect('search_residents')

# Add a new resident
def add_resident(request):
    if request.method == "POST":
        name = request.POST.get("name")
        occupation = request.POST.get("occupation")
        business = request.POST.get("business", "")
        house_no = request.POST.get("house_no")
        
        # Save the new resident to the database
        Resident.objects.create(
            name=name,
            occupation=occupation,
            business=business,
            house_no=house_no
        )
        return HttpResponse("Resident added successfully!")

    # Render the form template for GET requests
    return render(request, "residents/add_resident.html")
"""