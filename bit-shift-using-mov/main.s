//
// Bit shift using MOV
// - LSL: Logical Shift Left, shifts bits left (multiplication by powers of 2)
// - LSR: Logical Shift Right, shifts bits right with 0s in vacated positions
//
// https://developer.arm.com/documentation/ddi0602/2022-06/Base-Instructions/LSL--register---Logical-Shift-Left--register---an-alias-of-LSLV-


.global _start	            // Provide program starting address to linker

_start:
    B basic_moves           // Branch to section
    
basic_moves:
    // First initialize registers with MOVZ since MOVK preserves existing bits
    MOVZ    X1, #0                      // Initialize X1 to 0

    // ===========================
    // LSL
    // ===========================

    // binary=0b0001
    MOVK    X1, #0x1
    // binary=0b0010                    
    LSL     X1, X1, #1
    // binary=0b0100
    LSL     X1, X1, #1
    // binary=0b1000
    LSL     X1, X1, #1
    
    // ===========================
    // LSR
    // ===========================
    // Start with binary=0b1000 (from previous LSL operations)
    
    // binary=0b0100
    LSR     X1, X1, #1
    // binary=0b0010                    
    LSR     X1, X1, #1
    // binary=0b0001
    LSR     X1, X1, #1
    // binary=0b0000
    LSR     X1, X1, #1

    // ===========================
    // ROR
    // ===========================
    // First set up a value with multiple bits set
    MOVZ    X2, #0xF                    // binary=0b1111

    // Rotate right by 1 position
    // 0b1111 -> 0b1000000000000000000000000000000000000000000000000000000000001110
    ROR     X2, X2, #1

    // Let's use another example with alternating bits
    MOVZ    X2, #0xA                    // binary=0b1010
    // Rotate right by 1 position
    // 0b1010 -> 0b0000000000000000000000000000000000000000000000000000000000000101
    ROR     X2, X2, #1
    
    // Rotate right by 1 position again
    // 0b0101 -> 0b1000000000000000000000000000000000000000000000000000000000000100
    ROR     X2, X2, #1

    // ===========================
    // ASR
    // ===========================
    // First set up a positive number
    MOVZ    X3, #0x8                    // binary=0b1000
    
    // ASR preserves sign bit when shifting right
    // 0b1000 -> 0b0100
    ASR     X3, X3, #1
    // 0b0100 -> 0b0010                    
    ASR     X3, X3, #1
    // 0b0010 -> 0b0001
    ASR     X3, X3, #1
    // 0b0001 -> 0b0000
    ASR     X3, X3, #1

    // Now let's see how it handles negative numbers
    // Sets to negative number = 0b1111111111111111111111111111111111111111111111111111111111111000 = -8
    MOVN    X3, #0x7                    
    
    // ASR preserves the sign bit (1)
    // 0b1111111111111111111111111111111111111111111111111111111111111100 = -4
    ASR     X3, X3, #1
    // 0b1111111111111111111111111111111111111111111111111111111111111110 = -2
    ASR     X3, X3, #1
    // 0b1111111111111111111111111111111111111111111111111111111111111111 = -1
    ASR     X3, X3, #1

    B   exit            // Branch to exit

exit:
    MOV X8, #93     // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
