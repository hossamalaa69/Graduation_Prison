;Author:Hossam Alaa
;Game:Graduation Prison
;Bonus Task

.model compact
.stack 64
.data

;dimensions of game over image
GoverWidth EQU 220
GoverHeight EQU 80
;store bin file
GoverFile DB 'GameOver.bin', 0
;decide if file is read or write
GoverHandle DW ?
;resoltion of image(size of bytes)
FileData DB GoverWidth*GoverHeight dup(0)





x dw 19
y dw 79
shift db 0
char db 0
Tank db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 00h, 00h
  db 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 09h, 09h, 09h, 09h, 09h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 07h, 0Ah, 07h, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 07h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 07h, 07h, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 0Ah, 00h, 07h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 07h, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 00h, 0Ah, 0Ah, 0Ah, 07h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 07h, 07h, 07h, 07h, 00h, 07h, 07h, 07h, 00h, 07h, 07h, 07h, 00h, 07h, 07h, 07h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h


WALL                db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
                    db      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    db      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    db      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

bombColors          db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 95h, 4eh, 00h, 4eh, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 0dfh, 0dfh, 0dfh, 00h, 1eh, 00h, 4eh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 95h, 95h, 95h, 00h, 1eh, 00h, 00h, 95h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 7ch, 4eh, 4eh, 7ch, 00h, 4eh, 4eh, 95h, 95h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 7ch, 4eh, 4eh, 7ch, 95h, 00h, 95h, 95h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 7ch, 7ch, 7ch, 7ch, 95h, 95h, 00h, 00h, 00h, 0dfh, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 95h, 95h, 95h, 95h, 95h, 95h, 0dfh, 0dfh, 0dfh, 0dfh, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 95h, 95h, 95h, 95h, 0dfh, 0dfh, 0dfh, 0dfh, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 0dfh, 0dfh, 0dfh, 0dfh, 0dfh, 0dfh, 0dfh, 0dfh, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0dfh, 0dfh, 0dfh, 0dfh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

Triangle            db  2ah, 2ah, 2bh, 2bh, 2bh, 2bh, 2bh, 43h, 43h, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2ah, 2ah
                    db  2ah, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 43h, 43h, 43h, 43h, 43h, 2bh, 2bh, 2ah, 2ah, 2bh, 43h, 2ah
                    db  2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 2bh, 43h, 43h, 43h, 43h, 43h, 2bh, 2bh, 2bh, 2bh, 2bh, 43h, 2bh
                    db  2bh, 43h, 42h, 43h, 43h, 43h, 43h, 43h, 43h, 43h, 43h, 43h, 2bh, 2bh, 43h, 43h, 43h, 43h, 5bh, 2bh
                    db  2bh, 42h, 43h, 43h, 43h, 43h, 43h, 5bh, 5bh, 5bh, 5bh, 2bh, 43h, 43h, 43h, 5bh, 0fh, 0fh, 5bh, 43h
                    db  2bh, 43h, 43h, 5bh, 5bh, 5bh, 0fh, 0fh, 43h, 5bh, 43h, 43h, 43h, 5bh, 5bh, 5bh, 0fh, 5bh, 5bh, 43h
                    db  2bh, 2bh, 2bh, 43h, 43h, 5bh, 0fh, 5bh, 0fh, 0fh, 5bh, 5bh, 43h, 0fh, 0fh, 43h, 43h, 43h, 43h, 2bh
                    db  43h, 5bh, 2bh, 2bh, 43h, 43h, 43h, 5bh, 0fh, 0fh, 0fh, 43h, 5bh, 5bh, 5bh, 43h, 43h, 2bh, 2bh, 43h
                    db  43h, 5bh, 43h, 2bh, 2bh, 43h, 43h, 5bh, 5bh, 5bh, 0fh, 5bh, 43h, 43h, 5bh, 43h, 2bh, 2bh, 2bh, 43h
                    db  43h, 5bh, 2bh, 2bh, 43h, 43h, 5bh, 0fh, 0fh, 0fh, 5bh, 43h, 0fh, 0fh, 43h, 43h, 43h, 2bh, 2bh, 43h
                    db  2bh, 2bh, 2bh, 2bh, 43h, 5bh, 0fh, 0fh, 5bh, 0fh, 0fh, 0fh, 0fh, 0fh, 43h, 43h, 43h, 2bh, 2bh, 2bh
                    db  2bh, 2bh, 2bh, 2bh, 43h, 5bh, 0fh, 0fh, 5bh, 5bh, 0fh, 0fh, 5bh, 0fh, 43h, 43h, 2bh, 2bh, 43h, 2bh
                    db  0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0
                    db  0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0
                    db  0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0
                    db  0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0
                    db  0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0
                    db  0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0
                    db  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
					db  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5


xBomb dw ?
yBomb dw ?

Ywalls dw 79,109,139,169
xWalls dw 290
wallsCol db 0,0,0,0
wallFlag db 0

dim equ 30
dimb equ 20
Player db 11,?,11 dup('$')
welcome db "Welcome, Please enter your name :",'$'
score db 0
bombNum db 0

Scorestr db "Score:",'$'
BombsStr db "Bombs:",'$'
Right_ans db "   Right Answer"
GoodLuck db "Good Luck Next Time "

lvl1 db "Level 1"
q1 db "How many triangles ? :",'$'
q1after db "         triangles    ",'$'
q1y dw 30
q1x dw 30,80,130,180 
q1dim equ 20
q1WinAns db 0   ;1 win , 2 lose
q1Pass db "Congratulations, You've",10,13,"passed level 1"

Lvl2 db "Level 2"
q2 db "3*2+21/7="
q2win db "6 + 3 =  9"
q2WinAns db 0
q2Pass db "Congratulations, You've",10,13,"passed level 2"



Lvl3 db "Level 3"
q3 db "x^2-4x+4=0  >>   X="
q3win db "(2)*(2)-4(2)+4=0"
q3WinAns db 0
q3Pass db "Congratulations, You've",10,13,"passed level 3"



Lvl4 db "Level 4"
q4 db     "What's the capital",10,13,"of Australia? :"
q4choises   db "1-Bern        2-Ottawa",10,13,10,13
            db "3-Canberra    4-Stockholm"
q4WinAns db 0
q4Pass db "Congratulations, You've",10,13,"passed level 4"
       


Lvl5 db "Level 5"
q5 db     "  dy/dx=? :"
q5con       db "  y = X^4 + 3X.sin(X)+ 8" 
q5choises   db " 1:4X^3 + 3Cos(X) + 0",10,13
            db " 2:4X + 3Sin(X) + 1",10,13
            db " 3:3XCos(X) +4X^3 +3Sin(X)",10,13
			db " 4:Ask Hany!"
q5choisesWin   db "                     ",10,13
            db "                   ",10,13
            db " 3:3XCos(X) +4X^3 +3Sin(X)",10,13
			db "            "	
q5WinAns db 0
q5Pass db "Congratulations, You've",10,13,"passed level 5"



Lvl6 db "Level 6"
q6 db     "Choose Valid Command"
q6choises   db "1-Mov AX,ax   2-Mov BX,CL",10,13,10,13
            db "3-Pop BH      4-INC DX,7"
q6WinAns db 0
q6Pass db "Congratulations, You've",10,13,"passed level 6"
       

Lvl7 db "Level 7"
q7 db     "Choose Useful Command"
q7choises   db "1-XCHG AX,ax   2-AND BX,BX",10,13,10,13
            db "3-XOR DX,0     4-ADD CL,CL"
q7WinAns db 0
q7Pass db "Congratulations, You've",10,13,"passed level 7"


Lvl8 db "Level 8"
q8 db     "How many bytes does 'EQU' ",10,13,"reserve in memory ? :"
q8choises   db "(1) 0 Byte     (2) 2 Bytes",10,13,10,13
            db "(3) 1 Byte     (4) 2 Words"    ;56
q8WinAns db 0
q8Pass db "Congratulations, You've",10,13,"passed level 8"


Lvl9 db "Final Level" ;11
q9 db     "If bauad rate=12000 with 8",10,13,"Signals & required time=2ms"
   db     10,13,"Find transmitted bits ?:"  ;81
q9choises   db "(1) 120 bits   (2) 72 bits",10,13,10,13
            db "(3) 240 bits   (4) 24 bits"    
q9Ans       db "bits of 8 signals = 3 bits"
            db "BPS=3*baud rate = 36000   "
            db "bits = BPS*Time = 72 bits " ;82			
			
q9WinAns db 0
q9Pass db "Congratulations, You've",10,13,"passed All levels ;)"
       db 10,13,"Don't forget that",10,13,"Education is limitless"

.code
main proc far
mov ax,@data
mov ds,ax

call getName
call scrlScr

call GameCycle

mov ax,4c00h
int 21h

main endp

;-----------------------------
drawTank proc

 mov di,offset Tank    
 mov cx,x
 mov dx,y
 mov bx,dim
 nxtline1:
 line1:
 mov al,[di]
 inc di
 mov ah,0ch
 int 10h
 inc cx
 push bx
 mov bx,x
 add bx,dim
 cmp cx,bx
 pop bx
 jnz line1
 inc dx
 mov cx,x
 dec bx
 and bx,bx
 jnz nxtline1

ret    
drawTank endp    

scrlScr proc 

mov ax,0600h
mov bh,07
mov cx,0
mov dx,184FH
int 10h

ret
scrlScr endp

getName proc
readagain:
mov ah, 9
mov dx, offset welcome
int 21h
mov ah,0AH
mov dx,offset Player
int 21h
mov cl,0
cmp Player+1,cl
jz readagain
ret
getName endp

ClrBlock proc

mov cx,x
mov dx,y
mov al,0 
mov ah,0ch 
loop1:
mov dx,y
loop2:
int 10h
inc dx
mov bx,y
add bx,dim+1
cmp dx,bx
jz checkx
jnz loop2
checkx:    
inc cx
mov bx,x
add bx,dim+1
cmp cx,bx
jz endsquare    
jnz loop1
endsquare:
ret
ClrBlock endp
;----------------------------
CheckKey proc

call ClrBlock
cmp shift,72 ;up
jnz checkleft
sub y,dim
cmp y,79
jb noshiftU
ret
noshiftU:add y,dim
ret
checkleft:cmp shift,75 ;left
jnz checkdown
sub x,dim
cmp x,19
jl noshiftL
ret
noshiftL:add x,dim
ret
checkdown:cmp shift,80 ;down
jnz checkright
add y,dim
cmp y,170
ja noshiftD
ret
noshiftD:sub y,dim
ret
checkright:cmp shift,77 ;right
jnz checkFire
add x,dim
cmp x,289
je checkClr
ret
checkClr:call CheckWalls
cmp wallFlag,1
jnz noshiftR
ret
noshiftR:sub x,dim
ret

checkFire:
mov al,char
cmp al,27
jz termin
cmp al,102
jnz endfn
cmp bombNum,0
jz endfn
dec bombNum
call ScoreBox
mov ax,x
mov xBomb,ax
add xBomb,dim
mov ax,y
mov yBomb,ax
add yBomb,5
bullet:
call DrawBomb
call drawTank
call drawTank
call ClrBomb
add xBomb,15
mov ax,xWalls
cmp xBomb,ax
jb bullet
call ClrWall
cmp y,79
jnz second
mov wallsCol,1
ret
second: cmp y,109
jnz third
mov wallsCol+1,1
ret
third: cmp y,139
jnz forth
mov wallsCol+2,1
ret
forth:
mov wallsCol+3,1
jmp endfn

endfn:ret
termin:call Terminate
CheckKey endp
;-------------------------------------------------
DrawWalls           PROC 
 
                    MOV DI, 0
               ALL:
                    MOV SI, 0
                    mov cx,xWalls ;x
                    mov dx,Ywalls[DI] ;y
               Draw3:              
                    CMP SI, 0
                    JZ No3
                    MOV AX, SI
                    push cx
					mov cl,dim
					DIV cl
					pop cx
                    CMP AH, 0
                    JNZ No3
                    MOV CX,xWalls
                    INC dx
               No3: 
                    mov al,WALL[SI] ;Pixel color
                    mov ah,0ch ;Draw Pixel Command
                    int 10h
                    INC CX
                    INC SI
                    MOV AL, dim
					push cx
					mov cl,dim
                    MUL cl
					pop cx
                    CMP SI, AX
                    JNZ Draw3
                    ADD DI,2
                    CMP DI, 8
                    JNZ ALL
 
 ret
DrawWalls           ENDP
;------------------------------------------------
DrawBomb proc
 mov di,offset bombColors    
 mov cx,xBomb
 mov dx,yBomb
 mov bx,dimb
 nxtline3:
 line3:
 mov al,[di]
 inc di
 mov ah,0ch
 int 10h
 inc cx
 push bx
 mov bx,xBomb
 add bx,dimb
 cmp cx,bx
 pop bx
 jnz line3
 inc dx
 mov cx,xBomb
 dec bx
 and bx,bx
 jnz nxtline3

ret
DrawBomb endp

;-----------------------

ClrBomb proc
mov cx,xBomb
mov dx,yBomb
mov al,0 
mov ah,0ch 
loop3:
mov dx,yBomb
loop4:
int 10h
inc dx
mov bx,yBomb
add bx,dimb+1
cmp dx,bx
jz checkx2
jnz loop4
checkx2:    
inc cx
mov bx,xBomb
add bx,dimb+1
cmp cx,bx
jz endsquare2    
jnz loop3
endsquare2:
ret
ClrBomb endp

Delay1s PROC ; DELAY 1 SECOND 
  ; start delay
    push cx
    mov bx,15 ;15=1M/max of dx(ffffh)
    mov cx,0
    mov AL, 0
    MOV DX,0ffffh
    MOV AH, 86H
    dodo:
    INT 15H
    dec bx
    jnz dodo
    ;delay rest of 1M/max of dx(ffffh)
    mov cx,0
    mov AL, 0
    MOV DX,19675
    MOV AH, 86H
    INT 15H
    pop cx
    RET            
Delay1s ENDP

;----------------------

ClrWall proc
mov cx,xWalls
mov dx,y
mov al,0 
mov ah,0ch 
loop5:
mov dx,y
loop6:
int 10h
inc dx
mov bx,y
add bx,dim+1
cmp dx,bx
jz checkx3
jnz loop6
checkx3:    
inc cx
mov bx,xWalls
add bx,dim+1
cmp cx,bx
jz endsquare3    
jnz loop5
endsquare3:
ret
ClrWall endp

;-----------------------------------------

ClrAll proc
mov cx,0
mov dx,0
mov al,0 
mov ah,0ch 
loop5a:
mov dx,0
loop6a:
int 10h
inc dx
cmp dx,200
jz checkx3a
jnz loop6a
checkx3a:    
inc cx
cmp cx,320
jz endsquare3a    
jnz loop5a
endsquare3a:
ret
ClrAll endp


CheckWalls proc 
mov wallFlag,0

cmp y,79
jnz wall2
cmp wallsCol,1
jnz endchk
mov wallFlag,1
ret
wall2: cmp y,109
jnz wall3
cmp wallsCol+1,1
jnz endchk
mov wallFlag,1
ret
wall3: cmp y,139
jnz wall4
cmp wallsCol+2,1
jnz endchk
mov wallFlag,1
ret
wall4:
cmp wallsCol+3,1
jnz endchk
mov wallFlag,1
ret
endchk:ret
CheckWalls endp

Lv1Shapes proc

mov ax,0c0fh
mov cx, q1x
mov dx, q1y
mov si,1
mov di,cx
add di,si
c:int 10h
inc cx
cmp cx,di
jnz c
sub cx,si
dec cx
add si,2
mov di,cx
add di,si
inc dx
cmp dx,q1dim+30
JNE c
   
 mov cx,q1x+2
 mov dx,q1y
 mov bx,q1dim
 nxtline10:
 line10:
 mov ax,0c09h
 int 10h
 inc cx
 push bx
 mov bx,q1x+2
 add bx,q1dim
 cmp cx,bx
 pop bx
 jnz line10
 inc dx
 mov cx,q1x+2
 dec bx
 and bx,bx
 jnz nxtline10

mov ax,0c04h
mov cx, q1x+4
mov dx, q1y
mov si,1
mov di,cx
add di,si
c2:int 10h
inc cx
cmp cx,di
jnz c2
sub cx,si
dec cx
add si,2
mov di,cx
add di,si
inc dx
cmp dx,q1dim+30
JNE c2

mov cx,q1x+6
sub cx,10
mov dx,50
mov bx,q1dim+10
mov ax,0c0eh
loopline:
int 10h
inc cx
dec bx
jnz loopline

ret
Lv1Shapes endp

Lv1ShapesWin proc

mov ax,0c04h
mov cx, q1x
mov dx, q1y
mov si,1
mov di,cx
add di,si
cw:int 10h
inc cx
cmp cx,di
jnz cw
sub cx,si
dec cx
add si,2
mov di,cx
add di,si
inc dx
cmp dx,q1dim+30
JNE cw
   
 mov cx,q1x+2
 mov dx,q1y
 mov bx,q1dim
 nxtline10w:
 line10w:
 mov ax,0c00h
 int 10h
 inc cx
 push bx
 mov bx,q1x+2
 add bx,q1dim
 cmp cx,bx
 pop bx
 jnz line10w
 inc dx
 mov cx,q1x+2
 dec bx
 and bx,bx
 jnz nxtline10w

mov ax,0c04h
mov cx, q1x+4
mov dx, q1y
mov si,1
mov di,cx
add di,si
c2w:int 10h
inc cx
cmp cx,di
jnz c2w
sub cx,si
dec cx
add si,2
mov di,cx
add di,si
inc dx
cmp dx,q1dim+30
JNE c2w

mov cx,q1x+6
sub cx,10
mov dx,50
mov bx,q1dim+10
mov ax,0c00h
looplinew:
int 10h
inc cx
dec bx
jnz looplinew

ret
Lv1ShapesWin endp



ScoreBox proc

mov dx,78
mov cx,0
mov ax,0c09h
sloop:int 10h
inc cx
cmp cx,320
jnz sloop

     MOV AX, @DATA
     MOV ES, AX

     MOV BP, OFFSET Scorestr ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 5h ;GREEN
     MOV Cl,6 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,7 ;ROW TO PLACE STRING
     MOV DL,30; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET BombsStr ; ES: BP POINTS TO THE TEXT
     MOV Cl,6 ; LENGTH OF THE STRING
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,30; COLUMN TO PLACE STRING
     INT 10H
      
	 MOV BP, OFFSET Player+2 ; ES: BP POINTS TO THE TEXT
     MOV BL, 0ah ;GREEN
     MOV Cl,Player+1 ; LENGTH OF THE STRING
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,30; COLUMN TO PLACE STRING
     INT 10H

    
mov ah,2
mov dx,0725h
int 10h

mov ah,2
mov dl,score
add dl,30h
int 21h


mov ah,2
mov dx,0825h
int 10h

mov ah,2
mov dl,bombNum
add dl,30h
int 21h

mov cx,238
mov dx,0
mov ax,0c09h
lopl2:int 10h
inc dx
cmp dx,78
jnz lopl2

ret
ScoreBox endp


ClrScoreBox proc
mov cx,0
mov dx,9
mov al,0 
mov ah,0ch 
loop3s:
mov dx,0
loop4s:
int 10h
inc dx
cmp dx,75
jz checkx2s
jnz loop4s
checkx2s:    
inc cx
cmp cx,238
jz endsquare2s    
jnz loop3s
endsquare2s:
ret
ClrScoreBox endp

;--------------------
checkAns proc
cmp char,48
jb e
cmp char,57
ja e

mov ah,2
mov dl,char
int 21h

cmp char,51
jnz gameovq1
inc score
inc bombNum
call WinQ1
mov q1WinAns,1

e:ret
gameovq1:mov q1WinAns,2
ret
checkAns endp

;------------------------------------------------------
 
WinQ1 proc
     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,7 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
call Delay1s

     MOV BP, OFFSET q1after ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,22 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,1 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
	 
call Lv1ShapesWin	 
mov q1WinAns,1
call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q1Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H



ret
WinQ1 endp 
;---------------------------------------------------

;--------------------
checkAns2 proc
cmp char,48
jb e2
cmp char,57
ja e2

mov ah,2
mov dl,char
int 21h

cmp char,57
jnz gameovq2
inc score
inc bombNum
call WinQ2
mov q2WinAns,1

e2:ret
gameovq2:mov q2WinAns,2
ret
checkAns2 endp
;--------------------------------

;--------------------
checkAns3 proc
cmp char,48
jb e3
cmp char,57
ja e3

mov ah,2
mov dl,char
int 21h

cmp char,50
jnz gameovq3
inc score
inc bombNum
call WinQ3
mov q3WinAns,1

e3:ret
gameovq3:mov q3WinAns,2
ret
checkAns3 endp
;--------------------------------

checkAns4 proc
cmp char,49
jb e4
cmp char,52
ja e4

mov ah,2
mov dl,char
int 21h

cmp char,51
jnz gameovq4
inc score
inc bombNum
call WinQ4
mov q4WinAns,1

e4:ret
gameovq4:mov q4WinAns,2
ret
checkAns4 endp

;--------------------------------

checkAns5 proc
cmp char,49
jb e5
cmp char,52
ja e5

mov ah,2
mov dl,char
int 21h

cmp char,51
jnz gameovq5
inc score
inc bombNum
call WinQ5
mov q5WinAns,1

e5:ret
gameovq5:mov q5WinAns,2
ret
checkAns5 endp
;-------------------------------------------

checkAns6 proc
cmp char,49
jb e6
cmp char,52
ja e6

mov ah,2
mov dl,char
int 21h

cmp char,49
jnz gameovq6
inc score
inc bombNum
call WinQ6
mov q6WinAns,1

e6:ret
gameovq6:mov q6WinAns,2
ret
checkAns6 endp

;--------------------------------

checkAns7 proc
cmp char,49
jb e7
cmp char,52
ja e7

mov ah,2
mov dl,char
int 21h

cmp char,52
jnz gameovq7
inc score
inc bombNum
call WinQ7
mov q7WinAns,1

e7:ret
gameovq7:mov q7WinAns,2
ret
checkAns7 endp

;--------------------------------
checkAns8 proc
cmp char,49
jb e8
cmp char,52
ja e8

mov ah,2
mov dl,char
int 21h

cmp char,49
jnz gameovq8
inc score
inc bombNum
call WinQ8
mov q8WinAns,1

e8:ret
gameovq8:mov q8WinAns,2
ret
checkAns8 endp

;--------------------------------
checkAns9 proc
cmp char,49
jb e9
cmp char,52
ja e9

mov ah,2
mov dl,char
int 21h

cmp char,50
jnz gameovq9
inc score
inc bombNum
call WinQ9
mov q9WinAns,1

e9:ret
gameovq9:mov q9WinAns,2
ret
checkAns9 endp

;--------------------------------



WinQ2 proc
     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,7 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q2WinAns,1


mov cx,0
mov dx,25
mov ax,0c05h
lopans2:int 10h
inc cx
cmp cx,24
jnz lopans2

mov cx,30
mov dx,25
mov ax,0c05h
lopans22:int 10h
inc cx
cmp cx,62
jnz lopans22

call Delay1s
call Delay1s

     MOV BP, OFFSET q2Win ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0eh ;GREEN
     MOV Cl,10 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q2Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


ret
WinQ2 endp 
;---------------------------------------------------

WinQ3 proc
     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,7 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q3WinAns,1

     MOV BP, OFFSET q3win ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0eh ;GREEN
     MOV Cl,16 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q3Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


ret
WinQ3 endp 

;-------------------------------------------

WinQ4 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q4WinAns,1

mov cx,0
mov dx,56
mov ax,0c02h
lopans4:int 10h
inc cx
cmp cx,80
jnz lopans4


call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q4Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


ret
WinQ4 endp 
;---------------------------------------------------

WinQ5 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q5WinAns,1

     MOV BP, OFFSET q5choisesWin ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,06h ;GREEN
     MOV Cl,84 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,4 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call Delay1s
call Delay1s
call Delay1s
call Delay1s
call Delay1s


call ClrScoreBox

     MOV BP, OFFSET q5Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


ret
WinQ5 endp 
;---------------------------------------------------

WinQ6 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q6WinAns,1

mov cx,0
mov dx,40
mov ax,0c02h
lopans6:int 10h
inc cx
cmp cx,88
jnz lopans6


call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q6Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
ret
WinQ6 endp 
;---------------------------------------------------
WinQ7 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q7WinAns,1

mov cx,120
mov dx,58
mov ax,0c0bh
lopans7:int 10h
inc cx
cmp cx,208
jnz lopans7


call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q7Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
ret
WinQ7 endp 
;---------------------------------------------------
WinQ8 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q8WinAns,1

mov cx,0
mov dx,42
mov ax,0c0fh
lopans8:int 10h
inc cx
cmp cx,88
jnz lopans8

call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q8Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,39 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
ret
WinQ8 endp 
;---------------------------------------------------
WinQ9 proc

     MOV BP, OFFSET Right_ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,15 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,8 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

call ScoreBox 
mov q9WinAns,1

mov cx,120
mov dx,42
mov ax,0c0fh
lopans9:int 10h
inc cx
cmp cx,208
jnz lopans9

call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox

     MOV BP, OFFSET q9Ans ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 0ch ;GREEN
     MOV Cl,26 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
call Delay1s
call Delay1s     
call Delay1s
	 MOV BP, OFFSET q9Ans+26 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 0dh ;GREEN
     MOV Cl,26 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,5 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
call Delay1s
call Delay1s
call Delay1s
	 MOV BP, OFFSET q9Ans+52 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 0eh ;GREEN
     MOV Cl,26 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,7 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
call Delay1s
call Delay1s
call Delay1s

call ClrScoreBox
     MOV BP, OFFSET q9Pass ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 4h ;GREEN
     MOV Cl,88 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,3 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H
ret
WinQ9 endp 
;---------------------------------------------------

Terminate proc

Call ClrAll

mov ax,4c00h
int 21h

ret
Terminate endp


;------------------------------------------------------

ResetLv proc
mov wallsCol,0
mov wallsCol+1,0
mov wallsCol+2,0
mov wallFlag,0
mov x,19
mov y,79
mov shift,0
mov char,0
call drawTank
call DrawWalls
call ScoreBox
call ClrScoreBox
ret
ResetLv endp 
 
;----------------------------------------------------------------

;------------------------------------------------------------------
GameCycle proc
mov ax,0013h
int 10h
call ResetLv

call Level1
cmp q1WinAns,1
jnz endgame

call Level2
cmp q2WinAns,1
jnz endgame

call Level3
cmp q3WinAns,1
jnz endgame

call Level4
cmp q4WinAns,1
jnz endgame

call Level5
cmp q5WinAns,1
jnz endgame

call Level6
cmp q6WinAns,1
jnz endgame

call Level7
cmp q7WinAns,1
jnz endgame

call Level8
cmp q8WinAns,1
jnz endgame

call Level9
cmp q9WinAns,1
jnz endgame

call Terminate

endgame:call ScoreEnd

mov ax,4c00h
int 21h
ret
GameCycle endp
;---------------------------------------------------------------------------


;-----------------------------------------------------------------
Level1 proc

call ScoreBox
call Lv1Shapes
call DrawWalls

     MOV AX, @DATA
     MOV ES, AX

     MOV BP, OFFSET lvl1 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q1 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 3h ;GREEN
     MOV Cl,22 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,1 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

	 
looplv1:
call drawTank
mov ah,1
int 16h
jz looplv1
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q1WinAns,1
jz keyfire
call checkAns
cmp q1WinAns,2
jz endlv1
keyfire:call CheckKey
mov shift,0
cmp x,289
jae endlv1
jmp looplv1
endlv1:ret
Level1 endp

;------------------------------------------------------------------

Level2 proc
call ResetLv

     MOV BP, OFFSET Lvl2 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q2 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,3h ;GREEN
     MOV Cl,9 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv2:
call drawTank
mov ah,1
int 16h
jz looplv2
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q2WinAns,1
jz keyfire2
call checkAns2
cmp q2WinAns,2
jz endlv2
keyfire2:call CheckKey
mov shift,0
cmp x,289
jae endlv2
jmp looplv2
endlv2:ret

Level2 endp



;--------------------------------------------------------------
Level3 proc
call ResetLv

     MOV BP, OFFSET Lvl3 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q3 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,3h ;GREEN
     MOV Cl,19 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv3:
call drawTank
mov ah,1
int 16h
jz looplv3
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q3WinAns,1
jz keyfire3
call checkAns3
cmp q3WinAns,2
jz endlv3
keyfire3:call CheckKey
mov shift,0
cmp x,289
jae endlv3
jmp looplv3
endlv3:ret
Level3 endp
;--------------------------------------------------------------
Level4 proc
call ResetLv

     MOV BP, OFFSET Lvl4 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q4choises ; ES: BP POINTS TO THE TEXT
     MOV BL,0ch ;GREEN
     MOV Cl,51 ; LENGTH OF THE STRING
     MOV DH,4 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q4 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,35 ; LENGTH OF THE STRING
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv4:
call drawTank
mov ah,1
int 16h
jz looplv4
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q4WinAns,1
jz keyfire4
call checkAns4
cmp q4WinAns,2
jz endlv4
keyfire4:call CheckKey
mov shift,0
cmp x,289
jae endlv4
jmp looplv4
endlv4:ret

Level4 endp

;--------------------------------------------------------------
Level5 proc
call ResetLv

     MOV BP, OFFSET Lvl5 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q5con ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,24 ; LENGTH OF THE STRING
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q5choises ; ES: BP POINTS TO THE TEXT
     MOV BL,04h ;GREEN
     MOV Cl,84 ; LENGTH OF THE STRING
     MOV DH,4 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q5 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,11 ; LENGTH OF THE STRING
     MOV DH,1 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv5:
call drawTank
mov ah,1
int 16h
jz looplv5
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q5WinAns,1
jz keyfire5
call checkAns5
cmp q5WinAns,2
jz endlv5
keyfire5:call CheckKey
mov shift,0
cmp x,289
jae endlv5
jmp looplv5
endlv5:ret

Level5 endp
;----------------------------------------------------------------
Level6 proc
call ResetLv

     MOV BP, OFFSET Lvl6 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q6choises ; ES: BP POINTS TO THE TEXT
     MOV BL,0ch ;GREEN
     MOV Cl,50 ; LENGTH OF THE STRING
     MOV DH,4 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q6 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,20 ; LENGTH OF THE STRING
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv6:
call drawTank
mov ah,1
int 16h
jz looplv6
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q6WinAns,1
jz keyfire6
call checkAns6
cmp q6WinAns,2
jz endlv6
keyfire6:call CheckKey
mov shift,0
cmp x,289
jae endlv6
jmp looplv6
endlv6:ret

Level6 endp

;----------------------------------------------------------------

Level7 proc
call ResetLv

     MOV BP, OFFSET Lvl7 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q7choises ; ES: BP POINTS TO THE TEXT
     MOV BL,02h ;GREEN
     MOV Cl,56 ; LENGTH OF THE STRING
     MOV DH,4 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q7 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,21 ; LENGTH OF THE STRING
     MOV DH,2 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv7:
call drawTank
mov ah,1
int 16h
jz looplv7
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q7WinAns,1
jz keyfire7
call checkAns7
cmp q7WinAns,2
jz endlv7
keyfire7:call CheckKey
mov shift,0
cmp x,289
jae endlv7
jmp looplv7
endlv7:ret

Level7 endp

;----------------------------------------------------------------
Level8 proc
call ResetLv

     MOV BP, OFFSET Lvl8 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,7 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q8choises ; ES: BP POINTS TO THE TEXT
     MOV BL,02h ;GREEN
     MOV Cl,56  ; LENGTH OF THE STRING
     MOV DH,4   ;ROW TO PLACE STRING
     MOV DL,0   ;COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q8 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,49 ; LENGTH OF THE STRING
     MOV DH,1 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv8:
call drawTank
mov ah,1
int 16h
jz looplv8
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q8WinAns,1
jz keyfire8
call checkAns8
cmp q8WinAns,2
jz endlv8
keyfire8:call CheckKey
mov shift,0
cmp x,289
jae endlv8
jmp looplv8
endlv8:ret
Level8 endp

;----------------------------------------------------------------------------
Level9 proc
call ResetLv

     MOV BP, OFFSET Lvl9 ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,0Fh ;GREEN
     MOV Cl,11 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,0 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H


     MOV BP, OFFSET q9choises ; ES: BP POINTS TO THE TEXT
     MOV BL,02h ;GREEN
     MOV Cl,52  ; LENGTH OF THE STRING
     MOV DH,4   ;ROW TO PLACE STRING
     MOV DL,0   ;COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET q9 ; ES: BP POINTS TO THE TEXT
     MOV BL,03h ;GREEN
     MOV Cl,81 ; LENGTH OF THE STRING
     MOV DH,1 ;ROW TO PLACE STRING
     MOV DL,0 ; COLUMN TO PLACE STRING
     INT 10H

looplv9:
call drawTank
mov ah,1
int 16h
jz looplv9
mov shift,ah
mov char,al
mov ah,0
int 16h
cmp q9WinAns,1
jz keyfire9
call checkAns9
cmp q9WinAns,2
jz endlv9
keyfire9:call CheckKey
mov shift,0
cmp x,289
jae endlv9
jmp looplv9
endlv9:ret
Level9 endp

;----------------------------------------------------------------------------

ScoreEnd proc

call Delay1s
call Delay1s

mov ah,0
mov al,13h
int 10h

    CALL OpenFile
    CALL ReadData
	
    LEA BX , FileData ; BL contains index at the current drawn pixel
	
    MOV CX,50
    MOV DX,0
    MOV AH,0ch
	
; Drawing loop
drawLoop:
    MOV AL,[BX]
    INT 10h 
    INC CX
    INC BX
    CMP CX,GoverWidth+50
JNE drawLoop 
	
    MOV CX ,50
    INC DX
    CMP DX , GoverHeight
JNE drawLoop

     MOV BP, OFFSET GoodLuck ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL,09h ;GREEN
     MOV Cl,20 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,12 ;ROW TO PLACE STRING
     MOV DL,5 ; COLUMN TO PLACE STRING
     INT 10H
	 
	 MOV BP, OFFSET Player+2 ; ES: BP POINTS TO THE TEXT
     MOV BL, 0ah ;GREEN
     MOV Cl,Player+1 ; LENGTH OF THE STRING
     MOV DH,12 ;ROW TO PLACE STRING
     MOV DL,25; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET Scorestr ; ES: BP POINTS TO THE TEXT
     MOV AH, 13H ; WRITE THE STRING
     MOV AL, 01H; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
     XOR BH,BH ; VIDEO PAGE = 0
     MOV BL, 5h ;GREEN
     MOV Cl,6 ; LENGTH OF THE STRING
     mov ch,0
     MOV DH,14 ;ROW TO PLACE STRING
     MOV DL,16; COLUMN TO PLACE STRING
     INT 10H

     MOV BP, OFFSET BombsStr ; ES: BP POINTS TO THE TEXT
     MOV Cl,6 ; LENGTH OF THE STRING
     MOV DH,15 ;ROW TO PLACE STRING
     MOV DL,16; COLUMN TO PLACE STRING
     INT 10H

mov ah,2
mov dx,0E16h
int 10h

mov ah,2
mov dl,score
add dl,30h
int 21h


mov ah,2
mov dx,0F16h
int 10h

mov ah,2
mov dl,bombNum
add dl,30h
int 21h


mov cx,8
delay5s:
call Delay1s
loop delay5s
;after finishing delay, close image file then go to page2 
call CloseFile 
ret
ScoreEnd endp


;-------------------------------------------------------------
OpenFile PROC 

    ; Open file

    MOV AH, 3Dh
    MOV AL, 0 ; read only
    LEA DX, GoverFile
    INT 21h
    MOV [GoverHandle], AX
    
    RET

OpenFile ENDP

ReadData PROC

    MOV AH,3Fh
    MOV BX, [GoverHandle]
    MOV CX,GoverWidth*GoverHeight ; number of bytes to read
    LEA DX, FileData
    INT 21h
    RET
ReadData ENDP 


CloseFile PROC
	MOV AH, 3Eh
	MOV BX, [GoverHandle]

	INT 21h
	RET
CloseFile ENDP
;-------------------------

end 