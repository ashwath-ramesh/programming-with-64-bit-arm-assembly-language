//
// .align N adds padding bytes after previous elements to ensure 
// the next element starts at an address divisible by 2^N
// Examples: .align 2 = align to 4 bytes, .align 3 = align to 8 bytes
// Always place .align immediately before the item requiring alignment
// For best performance: align words(4B) to .align 2, quads(8B) to .align 3
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // Example of loading unaligned vs aligned data
    ADR X1, byte_val          // Get address of unaligned byte
    LDR X2, [X1]              // Load unaligned data - less efficient

    ADR X1, quad_val          // Get address of aligned quad
    LDR X2, [X1]              // Load aligned quad - efficient

    ADR X1, word_val          // Get address of aligned word
    LDR X2, [X1]              // Load aligned word - efficient

exit:
    MOV X8, #93                // Exit syscall
    SVC 0                      // Call kernel

.data
    .align 0    // No alignment needed for byte (optional)
    byte_val: .byte 0x42
    
    .align 2    // Align to 2^2 = 4 bytes for word
    word_val: .word 0x12345678
    
    .align 3    // Align to 2^3 = 8 bytes for quad
    quad_val: .quad 0x123456789ABCDEF0
