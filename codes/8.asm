ORG 0000H
    MOV A, #39H        ; Load packed BCD number (39H = 39 decimal)
    LCALL UNPACK       ; Unpack BCD into 20H (units) and 21H (tens)
    MOV B, #0AH        ; Load multiplier 10 (0AH)
    MOV A, 21H         ; Load tens digit (03H) into A
    MUL AB             ; A = 3 * 10 = 30 (1EH)
    ADD A, 20H         ; A = 1EH + 09H = 27H (39 decimal in hex)
HERE: SJMP HERE        ; Stop execution

UNPACK:
    MOV R1, A          ; Save original packed BCD (39H) in R1
    ANL A, #0FH        ; Mask upper nibble -> A = 09H
    MOV 20H, A         ; Store units digit in 20H
    MOV A, R1          ; Restore original BCD (39H) from R1 (Fixed!)
    ANL A, #0F0H       ; Mask lower nibble -> A = 30H
    SWAP A             ; Swap nibbles -> A = 03H
    MOV 21H, A         ; Store tens digit in 21H
    RET
END
