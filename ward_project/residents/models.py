from django.db import models

# Create your models here.

# class Resident(models.Model):
#     name = models.CharField(max_length=100)
#     age = models.IntegerField()
#     house_no = models.CharField(max_length=10)
#     occupation = models.CharField(max_length=50)
#     business = models.CharField(max_length=50, blank=True, null=True)
#     no_of_children = models.IntegerField(default=0)

    # def __str__(self):
    #     return self.name
    #in the example it uses a database which is not predefined it we have to create a table and insert values in it in the same db as we selected
    
#updated one which uses predefined db which is "ward"
# this is second step creating data-model for selected DB 
# next step is  displaying data in the webpage 
# A view fetches data from the database, and a template displays it.

class Resident(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    age = models.IntegerField()
    house_no = models.CharField(max_length=10)
    occupation = models.CharField(max_length=50)
    business = models.CharField(max_length=50, blank=True, null=True)
    no_of_children = models.IntegerField(default=0)

    class Meta:
        db_table = 'residents'  # Use the original table