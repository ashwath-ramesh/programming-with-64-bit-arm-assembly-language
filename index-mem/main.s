//
// Indexing through memory: pre & post indexing
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // Pre-indexing example
    ADR X1, mynumber           // Use ADR instead of LDR =symbol
    LDR X2, [X1, #8]!          // Pre-index load
    
    // Post-indexing example
    ADR X1, mynumber           // Reset base address
    LDR X2, [X1], #8           // Post-index load

exit:
    MOV X8, #93                // Exit syscall
    SVC 0                      // Call kernel

.data
    .byte 0x1
    .align 3                   // Ensure alignment
    mynumber: .quad 0x123456789ABCDEF0
