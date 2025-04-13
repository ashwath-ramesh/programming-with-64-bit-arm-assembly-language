//
// STP: Store Pair of registers to memory
//

.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // STP: Store a pair of registers to memory
    // ===========================

    // Load two different values into X2 and X3
    MOV X2, #0x1234        // First value
    MOV X3, #0x5678        // Second value

    // Store pair of registers (X2, X3) to memory
    LDR X1, =number_pair   // Get address where we'll store the pair
    STP X2, X3, [X1]       // Store X2 and X3 to consecutive memory locations

    // Load the pair back to different registers to verify
    LDP X4, X5, [X1]       // Load the pair of values into X4 and X5

    B exit

exit:
    MOV X8, #93            // Service command code 93 terminates this program
    SVC 0                  // Call linux to terminate the program

.data
    number_pair: .quad 0, 0    // Reserve space for storing two quad values
    