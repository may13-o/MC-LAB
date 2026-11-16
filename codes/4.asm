ORG 0000H
MOV R0, #10H    ; Start address of the 10 numbers
MOV R2, #0AH    ; Loop counter = 10 (0AH in hex)
CLR A           ; Clear A (holds lower byte of sum)
MOV B, A        ; Clear B (holds higher byte/carry of sum)
UP:
    ADD A, @ R0  ; Add number from RAM to Accumulator
    JNC SKIP    ; Jump if there is no carry
    INC B       ; Increment high byte if carry occurred
SKIP:
    INC R0      ; Point to next RAM location
    DJNZ R2, UP ; Repeat 10 times
MOV 20H, A      ; Store lower byte of result at 20H
MOV 21H, B      ; Store higher byte of result at 21H
END