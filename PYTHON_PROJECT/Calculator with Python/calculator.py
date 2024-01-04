from tkinter import *
root = Tk()
root.title("เครื่องคิดเลข")

content = ""
txt_input = StringVar(value="0")

display = Entry(font=('arial',30,'bold'),fg="white",bg="green",textvariable=txt_input,justify="right")
display.grid(columnspan=4)

def btn(number):
    global content
    content = content+str(number)
    txt_input.set(content)

def equal():
    global content
    calculate = float(eval(content))
    txt_input.set(calculate)
    content = ""
def clear():
    global content
    content = ""
    txt_input.set("")
    display.insert(0,"0")

btn7=Button(fg="black",font=('arial',30,'bold'),text="7",padx=30,pady=15,command=lambda:btn(7)).grid(row=1)
btn8=Button(fg="black",font=('arial',30,'bold'),text="8",padx=30,pady=15,command=lambda:btn(8)).grid(row=1,column=1)
btn9=Button(fg="black",font=('arial',30,'bold'),text="9",padx=30,pady=15,command=lambda:btn(9)).grid(row=1,column=2)
btntime=Button(fg="black",bg="orange",font=('arial',30,'bold'),text="c",padx=30,pady=15,command=clear).grid(row=1,column=3)


btn4=Button(fg="black",font=('arial',30,'bold'),text="4",padx=30,pady=15,command=lambda:btn(4)).grid(row=2)
btn5=Button(fg="black",font=('arial',30,'bold'),text="5",padx=30,pady=15,command=lambda:btn(5)).grid(row=2,column=1)
btn6=Button(fg="black",font=('arial',30,'bold'),text="6",padx=30,pady=15,command=lambda:btn(6)).grid(row=2,column=2)
btnplus=Button(fg="black",bg="orange",font=('arial',30,'bold'),text="+",padx=30,pady=15,command=lambda:btn("+")).grid(row=2,column=3)

btn1=Button(fg="black",font=('arial',30,'bold'),text="1",padx=30,pady=15,command=lambda:btn(1)).grid(row=3)
btn2=Button(fg="black",font=('arial',30,'bold'),text="2",padx=30,pady=15,command=lambda:btn(2)).grid(row=3,column=1)
btn3=Button(fg="black",font=('arial',30,'bold'),text="3",padx=30,pady=15,command=lambda:btn(3)).grid(row=3,column=2)
btnminus=Button(fg="black",bg="orange",font=('arial',30,'bold'),text="-",padx=35,pady=15,command=lambda:btn("-")).grid(row=3,column=3)

btn0=Button(fg="black",font=('arial',30,'bold'),text="0",padx=30,pady=15,command=lambda:btn(0)).grid(row=4,column=1)
btndot=Button(fg="black",font=('arial',30,'bold'),text=".",padx=35,pady=15,command=lambda:btn(".")).grid(row=4)
btndivision=Button(fg="black",bg="orange",font=('arial',30,'bold'),text="/",padx=36,pady=15,command=lambda:btn("/")).grid(row=4,column=2)
btnmultiply=Button(fg="black",bg="orange",font=('arial',30,'bold'),text="x",padx=30,pady=15,command=lambda:btn("*")).grid(row=4,column=3)

btnopen=Button(fg="black",font=('arial',30,'bold'),text="(",padx=35,pady=15,command=lambda:btn("(")).grid(row=5)
btnequal=Button(fg="black",bg="green",font=('arial',30,'bold'),text="=",padx=87,pady=15,command=equal).grid(row=5,column=1,columnspan=2)
btnclose=Button(fg="black",font=('arial',30,'bold'),text=")",padx=35,pady=15,command=lambda:btn(")")).grid(row=5,column=3)  
root.mainloop()
