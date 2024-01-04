from django.shortcuts import render,redirect
from blogs.models import Blogs
from django.db.models import Sum
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import auth
from category.models import Category
from django.core.files.storage import FileSystemStorage
from django.contrib import messages

@login_required(login_url="member")
def panel(request):
    writer = auth.get_user(request)
    blogs=Blogs.objects.filter(writer=writer)
    blogscount=blogs.count()
    total=Blogs.objects.filter(writer=writer).aggregate(Sum("views"))
    return render(request,"backend/index.html",{"blogs":blogs,"writer":writer,"blogscount":blogscount,"total":total})

@login_required(login_url="member")
def displayForm (request):
    categories=Category.objects.all()
    writer = auth.get_user(request)
    blogs=Blogs.objects.filter(writer=writer)
    blogscount=blogs.count()
    total=Blogs.objects.filter(writer=writer).aggregate(Sum("views"))
    return render(request,"backend/blogForm.html",{"blogs":blogs,"writer":writer,"blogscount":blogscount,"total":total,"categories":categories})

@login_required(login_url="member")
def insertData(request):
    try:
      if request.method == "POST" and request.FILES["image"]:
        datafile = request.FILES["image"]
        name = request.POST["name"]
        category = request.POST["category"]
        description = request.POST["description"]
        content = request.POST["content"]
        writer = auth.get_user(request)


        if str(datafile.content_type).startswith("image"):
            fs = FileSystemStorage()
            img_url="blogsImages/"+datafile.name
            filename = fs.save(img_url,datafile)
            blogs=Blogs(name = name,category_id=category,writer=writer,image=img_url,description=description,content=content)
            blogs.save()
            messages.info(request,"บันทึกเรียบร้อย")
            return redirect("displayForm")
        else:
            messages.info(request,"ไฟล์ที่อัพโหลดไม่รองรับ กรุณาอัพโหลดไฟล์รูปภาพอีกครั้ง")
            return redirect("displayForm")
    except:
            return redirect("displayForm")

        
@login_required(login_url="member")
def deletedata(request,id):
   try:
     blog=Blogs.objects.get(id=id)
     fs=FileSystemStorage()
     fs.delete(str(blog.image))
     blog.delete()
     return redirect('panel')
   except:
     return redirect('panel')


@login_required(login_url="member")
def editdata(request,id):
  try:
    categories=Category.objects.all()
    writer = auth.get_user(request)
    blogs=Blogs.objects.filter(writer=writer)
    blogscount=blogs.count()
    total=Blogs.objects.filter(writer=writer).aggregate(Sum("views"))
    blogedit=Blogs.objects.get(id=id)
    return render(request,"backend/editForm.html",{"blogedit":blogedit,"blogs":blogs,"writer":writer,"blogscount":blogscount,"total":total,"categories":categories})
  except:
    return redirect('panel')
@login_required(login_url="member")
def updatedata(request,id):
    try:
     if request.method == "POST":
        blog=Blogs.objects.get(id=id)
        name = request.POST["name"]
        category = request.POST["category"]
        description = request.POST["description"]
        content = request.POST["content"]
        
        blog.name = name
        blog.category_id = category
        blog.description = description
        blog.content = content
        blog.save()
                
        if  request.FILES["image"]:
            datafile = request.FILES["image"]
            if str(datafile.content_type).startswith("image"):
                fs=FileSystemStorage()
                fs.delete(str(blog.image))
            
                img_url="blogsImages/"+datafile.name
                filename = fs.save(img_url,datafile)
                blog.image = img_url
                blog.save()
                return redirect("panel")
   
        return redirect("panel")
    except:
        return redirect("panel")
    