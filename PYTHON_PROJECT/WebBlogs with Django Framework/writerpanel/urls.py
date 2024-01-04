from django.urls import path
from .views import *

urlpatterns=[
    path('',panel,name="panel"),
    path('displayForm',displayForm,name="displayForm"),
    path('insertData',insertData,name="insertData"),
    path('deletedata/<int:id>',deletedata,name="deletedata"),
    path('editdata/<int:id>',editdata,name="editdata"),
    path('updatedata/<int:id>',updatedata,name="updatedata")
]