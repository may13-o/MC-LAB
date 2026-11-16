MOV A, #NUMBER
; Load the required hex number eg. 89H
LCALL HEX_BCD ; This function converts the number in A reg to its BCD
;returns unpacked BCD number in 20h,21h and 22h of internal RAM
MOV R1,20H
; store the unpacked BCD number in bank registers
MOV R2,21H
MOV R3,22H
HERE: SJMP HERE
; Stop the program
HEX_BCD: MOV B, #0AH
DIV AB
MOV 22H, B
MOV B, #0AH; first division by 0A , if A = 89h, after division A= 0Dh, B= 07h
DIV AB
; second division by 0Ah
MOV 21H, B ; the hex number (0Dh) is converted to BCD, A=01, B=03
MOV 20H, A ;89H 01 03 07 unpacked form of 137 BCD value
RET
END