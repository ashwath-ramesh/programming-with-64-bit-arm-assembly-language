//
// MOVZ: Moves a 16-bit value into a register while zeroing all other bits
// 

.global _start	            // Provide program starting address to linker

_start:
    B basic_moves           // Branch to section
    
basic_moves:
    MOVZ    X1, #0xF                    // binary=0b1111 hex=0xF
    MOVZ    X2, #0xF, LSL #16           // binary=0b1111000000000000 hex=0xF0000

    // Notice how LSL shifts the 16-bit value left by the specified number of bits,
    // filling the lower bits with zeros.
    MOVZ    X2, #0xF, LSL #32           // binary=0b111100000000000000000000000000000000 hex=0xF00000000

    B   exit            // Branch to exit

exit:
    MOV X8, #93     // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
