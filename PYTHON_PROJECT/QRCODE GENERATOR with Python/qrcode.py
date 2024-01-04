from tkinter import *
import pyqrcode
import png
from PIL import ImageTk,Image
def create():
    link_name= name_entry.get()
    link = link_entry.get()
    filename=link_name+".png"
    url=pyqrcode.create(link)
    url.png(filename,scale=5)
    
    image=ImageTk.PhotoImage(Image.open(filename))
    image_label=Label(image=image)
    image_label.image=image
    canvas.create_window(200,370,window=image_label)

root = Tk()
root.title("QRCODE GENERATOR")
canvas=Canvas(root,width=400,height=500,bg="light blue")
canvas.pack()

app_label=Label(root,text="QRCODE Generator",font=("Arial",20,"bold"),bg="light blue")
canvas.create_window(200,50,window=app_label)

name_label=Label(root,text="ชื่อคิวอาร์โค้ด",bg="light blue")
canvas.create_window(200,100,window=name_label)

link_label=Label(root,text="URL",bg="light blue")
canvas.create_window(200,160,window=link_label)

name_entry=Entry(root)
canvas.create_window(200,130,window=name_entry)

link_entry=Entry(root)
canvas.create_window(200,190,window=link_entry)

btn1=Button(text="สร้างคิวอาร์โค้ด",command=create)
canvas.create_window(200,230,window=btn1)

root.mainloop()           