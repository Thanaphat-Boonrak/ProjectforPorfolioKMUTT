from django.urls import path
from .views import *

urlpatterns=[
    path('',index),
    path('blogs/<int:id>',blogDetail,name="blogDetail"),
    path('blogs/category/<int:category_id>',search,name="search"),
    path('blogs/writer/<str:writer>',searchwriter,name="searchwriter")
]