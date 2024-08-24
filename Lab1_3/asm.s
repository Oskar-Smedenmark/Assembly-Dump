
       NAME main
       PUBLIC main
       SECTION .text : CODE(2)
       THUMB

main
        LDR R0, =vector         ; load the vector into R0
        LDR R6, [R0], #4        ; load R6 with the first element of R0 and add 4 to R0
        MOV R7, R6              ; set R7 to the value of R6
        MOV R5, #0              ; set R5 to 0, used as a counter
        MOV R3, #19             ; set R3 to the vector length
LOOP    
        CMP R5, R3              ; compare R5 to R3
        BNE LOAD                ; branch to LOAD if the Z flag is clear
        B STOP                  ; branch to STOP
LOAD   
        LDR R1, [R0], #4        ; load R1 with R0 and then add 4 to R0
        CMP R7, R1              ; compare R1 to R7
        BGT NEXT                ; branch to NEXT if the Z flag is clear and the N and V are the same
        MOV R7, R1              ; set R7 to the value of R1
NEXT   
        CMP R6, R1              ; compare R6 to R1
        BLT PREP                ; branch to PREP if the N and V flag is different
        MOV R6, R1              ; set R6 to the value of R1
PREP
        ADD R5, R5, #1          ; R5 = R5 +1
        B LOOP                  ; branch to LOOP
STOP B  STOP                    ; infinite loop

       ALIGNROM 2
       DATA
vector
       DC32 14, 25, 2, 27, 3
       DC32 22, 13, 4, 24, 6
       DC32 26, 18, 8, 15, 9
       DC32 28, 10, 7, 17, 5
  END

