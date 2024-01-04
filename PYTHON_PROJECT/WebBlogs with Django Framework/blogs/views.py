from django.shortcuts import render
from django.http import HttpResponse
from category.models import Category
from .models import Blogs
from django.core.paginator import *
# Create your views here.
def index(request):
    categories = Category.objects.all()
    blogs = Blogs.objects.all().order_by('pk')
    last = Blogs.objects.all().order_by('-pk')[:2]
    
    popular=Blogs.objects.all().order_by('-views')[:3]
    suggest=Blogs.objects.all().order_by('views')[:3]
    
    paginator=Paginator(blogs,2)
    try:
       page = int(request.GET.get('page',1))
    except:
       page = 1
    try:
        blogPerpage = paginator.page(page)
    except(EmptyPage,InvalidPage):
        blogPerpage = paginator.page(paginator.num_pages)
    return render(request,"frontend/index.html",{'categories':categories,'blogs':blogPerpage,'last':last,'popular':popular,'suggest':suggest})
def blogDetail(request,id):
    categories = Category.objects.all()
    popular=Blogs.objects.all().order_by('-views')[:3]
    suggest=Blogs.objects.all().order_by('views')[:3]
    singleblog=Blogs.objects.get(id=id)
    singleblog.views = singleblog.views+1
    singleblog.save()
    return render(request,"frontend/blogDetail.html",{'blog':singleblog,'categories':categories,'popular':popular,'suggest':suggest})
def search(request,category_id):
    blogs = Blogs.objects.filter(category_id=category_id)
    popular=Blogs.objects.all().order_by('-views')[:3]
    suggest=Blogs.objects.all().order_by('views')[:3]
    category_name = Category.objects.get(id=category_id)
    categories = Category.objects.all()
    return render(request,"frontend/searchCategory.html",{'blogs':blogs,'categories':categories,'popular':popular,'suggest':suggest,'category_name':category_name})
def searchwriter(request,writer):
        blogs = Blogs.objects.filter(writer=writer)
        popular=Blogs.objects.all().order_by('-views')[:3]
        suggest=Blogs.objects.all().order_by('views')[:3]
        categories = Category.objects.all()
        return render(request,"frontend/searchwriter.html",{'blogs':blogs,'categories':categories,'popular':popular,'suggest':suggest,'writer':writer})
