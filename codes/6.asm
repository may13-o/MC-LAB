MOV R3, #10 
DEC R3 
NEXT_2: 
  MOV R0, #10H ;
  MOV R2,03H ; 
  NEXT_1: 
    MOV A, @R0 ;
    INC R0 
    MOV 30H, @R0 ;
    CJNE A,30H, CHECK ;
  CHECK: 
    JC NO_EXCHANGE ; 
    XCH A, @R0 ; 
    DEC R0 
    MOV @R0, A 
    INC R0 
  NO_EXCHANGE: 
    DJNZ R2, NEXT_1 ; 
  DJNZ R3, NEXT_2 ; 
END
