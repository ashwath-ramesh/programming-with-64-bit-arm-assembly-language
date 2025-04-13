//
// Indexing through memory: pre & post indexing
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    
    // ===========================
    // LDRB: Load a byte from memory: (a) with regular offset (b) with pre-indexing (c) post-indexing
    // ===========================

    ADR X1, mynumber           // Use ADR instead of LDR =symbol
    // LDR X2, [X1, #8]!          // Pre-index load
    
    // (a) Regular offset load
    // (i) Keep X1 value
    // (ii) Load data from (X1 + 1 byte)
    LDRB W2, [X1, #1]
    
    // (b) Pre-indexing example
    // (i) Update X1 value
    // (ii) Load data from (X1 + 1 byte)
    LDRB W3, [X1, #1]!

    // (c) Post-indexing example
    // (i) Load data from (X1byte)
    // (ii) Update X1 value
    LDRB W4, [X1], #1


    // ===========================
    // LDR: Load data from memory: (a) with regular offset (b) with pre-indexing (c) post-indexing
    // ===========================

    ADR X5, mynumber

    // (a) Regular offset load
    // Load from base address
    LDR X6, [X5]
    
    // (b) Pre-indexing example
    // (i) First update X5 by 1 byte
    // (ii) Load data
    LDR X7, [X5, #1]!

    // (c) Post-indexing example
    // (i) First load from current X5
    // (ii) then update X5 by 1 byte
    LDR X8, [X5], #1

exit:
    MOV X8, #93                // Exit syscall
    SVC 0                      // Call kernel

.data
    .align 3                   // Ensure 8-byte alignment
    mynumber: 
        .quad 0x123456789ABCDEF0
