//
// LDRB: Load data byte from memory using brackets
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
    LDRB W2, [X1]                // Load data byte from memory address in X1 into X2

.data
    mynumber: .quad 0x123456789ABCDEF0
    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
    