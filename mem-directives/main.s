//
// Memory directives: .ascii, .byte, .word, .short, .long, .quad, .fill, .rept, .endr
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // xxx
    // ===========================
    
    
    

    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program