//
// Demonstrates STRB: Store a single byte to memory
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // STRB: Store a single byte to memory
    // ===========================
    
    // Store a single byte from memory address to register
    

    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
