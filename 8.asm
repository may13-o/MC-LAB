MOV A, #39H ; Loading the BCD byte data for conversion
LCALL UNPACK ; function return the value in 20h and 21h location
; input parameter in A reg.
MOV B, #0AH
MOV A,21H
; multiply the higher byte of unpacked data with 0Ah
MUL AB
ADD A, 20H ; hex equivalent in A reg.
HERE: SJMP HERE
UNPACK: MOV R1, A
ANL A, #0FH ; mask the higher nibble
MOV 20H, A
; store lower digit
MOV R1, A
ANL A, #0F0H ; mask the lower digit
SWAP A
; swap the digits
MOV 21H, A
; store higher digit
RET
END