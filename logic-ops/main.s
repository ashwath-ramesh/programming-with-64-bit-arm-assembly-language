//
// Demonstrates basic logical operations: AND, EOR, ORR, BIC
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // AND - Bitwise AND operation
    // Y = A AND B
    // Truth table:
    //   A  B  |  Result
    //   0  0  |    0
    //   0  1  |    0  
    //   1  0  |    0
    //   1  1  |    1
    // ===========================
    MOV X1, #0xFF00        // X1 = 1111 1111 0000 0000
    MOV X2, #0x0FF0        // X2 = 0000 1111 1111 0000
    AND X3, X1, X2         // X3 = 0000 1111 0000 0000

    // ===========================
    // EOR - Bitwise Exclusive OR
    // Y = A XOR B
    // Truth table:  
    //   A  B  |  Result
    //   0  0  |    0
    //   0  1  |    1
    //   1  0  |    1
    //   1  1  |    0
    // ===========================
    MOV X1, #0xFF00        // X1 = 1111 1111 0000 0000
    MOV X2, #0x0FF0        // X2 = 0000 1111 1111 0000
    EOR X3, X1, X2         // X3 = 1111 0000 1111 0000

    // ===========================
    // ORR - Bitwise OR
    // Y = A OR B
    // Truth table:
    //   A  B  |  Result
    //   0  0  |    0
    //   0  1  |    1
    //   1  0  |    1
    //   1  1  |    1
    // ===========================
    MOV X1, #0xFF00        // X1 = 1111 1111 0000 0000
    MOV X2, #0x0FF0        // X2 = 0000 1111 1111 0000
    ORR X3, X1, X2         // X3 = 1111 1111 1111 0000

    // ===========================
    // BIC - Bit Clear (AND NOT)
    // Y = A AND (NOT B)
    // Truth table:
    //   A  B  |  Result
    //   0  0  |    0
    //   0  1  |    0
    //   1  0  |    1
    //   1  1  |    0
    // ===========================
    MOV X1, #0xFF00        // X1 = 1111 1111 0000 0000
    MOV X2, #0x0FF0        // X2 = 0000 1111 1111 0000
    BIC X3, X1, X2         // X3 = 1111 0000 0000 0000


exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
