import cv2

cap=cv2.VideoCapture("VID_20220215_095756.mp4")
face_cascade=cv2.CascadeClassifier("faces.xml")

while (cap.isOpened()):
    check,frame = cap.read()
    if check == True:
        gray_img=cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
        facedetect=face_cascade.detectMultiScale(gray_img,1.3,5)
        for (x,y,w,h) in facedetect:
            frame[y:y+h,x:x+w]=cv2.blur(frame[y:y+h,x:x+w],(100,100))
            cv2.imshow("OutPut",frame) 
        if cv2.waitKey(1) & 0xFF==ord("e"):
            break
    else:
        break
    
cap.release()
cv2.destroyAllWindows()