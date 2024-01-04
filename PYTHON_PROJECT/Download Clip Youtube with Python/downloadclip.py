from tkinter import *
from pytube import *
from moviepy.editor import *
root=Tk()
root.title("Youtube Dowloader")
canvas=Canvas(root,width=400,height=200)
canvas.pack()

def download():
    video_path=link.get()
    mp4=YouTube(video_path).streams.get_highest_resolution().download()
    video_clip=VideoFileClip(mp4)
    video_clip.close()
app_name=Label(root,text="Download Video from youtube",font=("Arial",20,"bold"))
canvas.create_window(200,50,window=app_name)

link=Entry(root,width=60)
bts=Button(text="Download",command=download)
canvas.create_window(200,100,window=link)
canvas.create_window(200,150,window=bts)
root.mainloop()