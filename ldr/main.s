//
// LDR: Loads address / data from memory into a register. Also used to load large constants that don't fit in immediate values.
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // LDR: Loads address / data from memory into a register
    // ===========================

    LDR X1, =helloworld
    // Load a 64-bit constant using LDR
    LDR X2, =0x123456789ABCDEF0   // Load large constant that can't fit in immediate

.data
    helloworld: .ascii "Hello World\n"
    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
