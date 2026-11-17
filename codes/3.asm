MOV R2, #21H      ; Load immediate value 21H (source high byte)
MOV R3, #57H      ; Load immediate value 57H (destination high byte)
MOV R4, #10       ; Load immediate decimal 10 (byte counter)
MOV DPTR, #2100H  ; Load starting source address 2100H
UP: MOVX A, @DPTR ; Read byte from external source memory
MOV DPH, R3       ; Switch DPTR high byte to 57H
MOVX @DPTR, A     ; Write byte to external destination memory
MOV DPH, R2       ; Switch DPTR high byte back to 21H
INC DPTR          ; Point to next memory address
DJNZ R4, UP       ; Decrement counter and repeat if not zero
END               ; End of program
