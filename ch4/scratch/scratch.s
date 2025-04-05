.global _start

_start:
    MOV X1, #3

loopEQ:
    SUBS X1, X1, #1
    CMP X1, #0
    B.NE loopEQ

exit:
    MOV W0, #0      // Use 0 return code
    MOV X8, #93      // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
    