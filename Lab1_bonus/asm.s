  NAME main
  PUBLIC main
  SECTION .text : CODE(2)
  THUMB
  
main
  LDR R0, =vector         ; load the vector into R0
  MOV R1, #0              ; move a 0 into R3
  MOV R3, #21             ; move a 21 into R3
  
OUTER
  CMP R1, #20             ; compare R1 to 20
  BGT STOP                ; branch to STOP if R1 is bigger or the same as 20
  MOV R2, #0              ; move a 0 into R3
  SUB R3, R3, #1          ; R3 = R3 - 1
  
INNER
  CMP R2, R3              ; compare R2 to R3
  BEQ OUTPRE              ; branch to OUTPRE if R2 and R3 are equal
  LDR R4, [R0], #4        ; load R0 into R4 then add 4 to R0
  LDR R5, [R0]            ; load the value of R0 to R5
  CMP R5, R4              ; compare R5 to R4
  BGT INPRE               ; branch to INPRE  if R5 is bigger or the same R4 
  SUB R0, R0, #4          ; R0 = R0 - 1
  STR R5, [R0]            ; take R5 and store it on the memory pos of R0
  STR R4, [R0, #4]        ; take R4 and store it on the memory pos of R0 + 4
  ADD R0, R0, #4          ; R0 = R0 + 4
  
INPRE
  ADD R2, R2, #1          ; R2 = R2 + 1
  B INNER                 ; branch to INNER
  
OUTPRE
  ADD R1, R1,#1           ; R1 = R1 + 1
  MOV R6, R3              ; move R3 into R6
  MOV R8, #4              ; move 4 into R8
  MUL R7, R6, R8          ; R7 = R6 * R8
  SUB R0, R0, R7          ; R0 = R0 - R7
  B OUTER                 ; branch to OUTER
  
STOP B  STOP              ; infinite loop

  ALIGNROM 2
  DATA
  
vector
  DC32 25, 14, 2, 27, 3
  DC32 22, 13, 4, 24, 6
  DC32 26, 18, 8, 15, 9
  DC32 28, 10, 7, 17, 5
  
  END 