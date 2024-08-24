        NAME    main
        PUBLIC  main
        SECTION .text : CODE (2)
        THUMB
main
      MOV R0, #0            ; (R0) <0
      MOV R1, #0            ; (R1) <0
LOOP  CMP R1, #9            ; jämför (R1) med 9
      BNE ADD0              ; olika --> hoppa till ADD0
      MOV R1, #0            ; reset R1
      ADD R0, R0, #7        ; uppdatera först: (R0) <-- (R0) + 7(för att skippa A-F)
      B ADD1                ; hoppa till ADD1
ADD0  ADD R0, R0, #1        ; (R0) <-- (R0) + 1
      ADD R1, R1, #1        ; (R1) <-- (R1) + 1
ADD1  CMP R0, #153          ; jämför (R1) med 10
      BNE LOOP              ; olika --> hoppa till LOOP, upprepa
STOP  B STOP                ; infinite loop
      END