MOV R0, #10H ; Memory pointer
MOV R2, #10 ; Total numbers to be added
CLR A ; clear the lower byte of result
MOV 20H, A ; Clear the higher byte of result
UP: ADD A, @R0 ; Adding the number to Acc (A = A+@R0)
JNC SKIP
; Check for carry flag
INC 21H
; Update the higher byte of result on getting carry
SKIP: INC R0
DJNZ R2, UP
MOV 20H, A ; Store the lower byte of the result
END