from tkinter import *
from gtts import *

def contomp3():
    word=text_entry.get()
    language="th"
    text="sound.mp3"
    output=gTTS(text=word,lang=language,slow=False)
    output.save(text)

root=Tk()
root.title("แปลงข้อความเป็นเสียง")
canvas=Canvas(root,width=400,height=300)
canvas.pack()

app_label=Label(text="แปลงข้อความเสียง",font=("Arial",20,"bold"))
canvas.create_window(200,100,window=app_label)

text_entry=Entry(root)
canvas.create_window(200,150,window=text_entry,width=270)

btn=Button(text="แปลงเป็นเสียง",command=contomp3)
canvas.create_window(200,200,window=btn)
root.mainloop()