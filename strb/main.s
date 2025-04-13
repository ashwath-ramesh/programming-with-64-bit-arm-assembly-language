//
// STRB: Store a byte from a register into memory
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // LDR: Load data from memory using brackets
    // ===========================

    // Load address of message into X1
    LDR X1, =mynumber           // Get address of message
    LDR X2, [X1]                // Load data from memory address in X1 into X2

    // Store X2 into storenumber
    LDR X1, =storenumber        // Get address of storenumber
    STR X2, [X1]                // Store X2 into memory at address in X1

    // Store lowest byte from X2 into memory at X3
    // Load address to store byte into X3
    LDR X3, =bytestore          // Get address to store byte
    STRB W2, [X3]               // Store least significant byte of X2 into memory at X3

    LDR X4, [X3]                // Get least signifncant byte stored in the address listed in X3, and load that into register X4 (Value=0xf0)

    B exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program

.data
    mynumber: .quad 0x123456789ABCDEF0
    storenumber: .quad 0        // Reserve space for storing a quad value
    bytestore: .byte 0          // Reserve space for storing a single byte
