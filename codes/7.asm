ORG 0000H
    MOV A, #89H        ; Load hex number (89H = 137 decimal)
    LCALL HEX_BCD      ; Convert hex in A to unpacked BCD
    MOV R1, 20H        ; Hundreds digit (01H) -> R1
    MOV R2, 21H        ; Tens digit (03H)     -> R2
    MOV R3, 22H        ; Units digit (07H)    -> R3
HERE: SJMP HERE        ; Stop execution

HEX_BCD:
    MOV B, #0AH        ; Load divisor 10 (0AH)
    DIV AB             ; A = Quotient (0DH), B = Remainder (07H)
    MOV 22H, B         ; Store units digit in 22H
    MOV B, #0AH        ; Reload divisor 10
    DIV AB             ; A = Quotient (01H), B = Remainder (03H)
    MOV 21H, B         ; Store tens digit in 21H
    MOV 20H, A         ; Store hundreds digit in 20H
    RET
END
