//
// MOVK: Moves a 16-bit value into a register while preserving existing bits
//

.global _start	            // Provide program starting address to linker

_start:
    B basic_moves           // Branch to section
    
basic_moves:
    // First initialize registers with MOVZ since MOVK preserves existing bits
    MOVZ    X1, #0                      // Initialize X1 to 0
    MOVZ    X2, #0                      // Initialize X2 to 0

    // Now use MOVK to set specific 16-bit portions while keeping other bits
    MOVK    X1, #0xF                    // Sets lowest 16 bits to 0xF
                                        // binary=0x000000000000000F
                                        
    // binary=0b0000000000000000000000001111000000000000 hex=0xF000000
    MOVK    X2, #0xF, LSL #16           

    // Notice how LSL shifts the 16-bit value left by the specified number of bits.
    // binary=0b0000000000001111000000000000111100000000000000 hex=0xF00000F000000
    MOVK    X2, #0xF, LSL #32           

    B   exit            // Branch to exit

exit:
    MOV X8, #93     // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
