from django.shortcuts import render, get_object_or_404, redirect
from .models import Resident
from django.db.models import Q
from django.http import HttpResponse

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
