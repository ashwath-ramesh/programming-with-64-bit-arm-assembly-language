//
// ADD: Adds two values
// ADDS: Adds two values and updates status flags
// ADC: Adds two values with carry
// Binary Calculator: https://www.rapidtables.com/calc/math/binary-calculator.html
// 

.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section
    
basics:
    // ===========================
    // Addition using 1 immediate value. Imm value can be 12-bits
    // ===========================
    // W1: contains final sum
    // W2: holds 1 value to add
    MOV W2, #0x5
    ADD W1, W2, #0x3

    // ===========================
    // Addition using 1 immediate value. Imm value > 12-bits
    // ===========================
    // W1: contains final sum
    // W2: holds 1 value to add
    // Uncommenting below will give us "Error: immediate out of range" on assembly
    // ADD W1, W2, #0x1DA5

    // ===========================
    // Addition using 1 immediate value. Imm value can be 12-bits. Imm value is shifted before adding.
    // ===========================
    // W3: contains final sum
    // W4: contains 1 value to add
    MOV W3, #0x5
    // For immediaet values: shift of register can be 0 or 12
    // 0b101 + 0b11000000000000 = 0b11000000000101 = 0x3005
    ADD W4, W3, #0x3, LSL 12

    // ===========================
    // Addition of 2 registers
    // ===========================
    // W5: contains final sum
    // W6: holds 1 value to add
    MOV W5, #0x5A
    MOV W6, #0x4E
    // 0b1011010 + 0b1001110 = 0b10101000 = 0xA8
    ADD W6, W5, W6

    // ===========================
    // Addition of 2 registers, where one register's value is shifted before adding
    // ===========================
    // W5: contains final sum
    // W6: holds 1 value to add
    MOV W5, #0x5A
    MOV W6, #0x4E
    // 0b1011010 + 0b10011100 = 0b11110110 = 0xF6
    // For register values: shift of register can be any number that fits register
    ADD W6, W5, W6, LSL 1

    // ===========================
    // With register extension option: SXTB Signed extended byte
    // ===========================
    // The SXTB (Sign eXTend Byte) instruction in ARM64 assembly is a way to take 
    // a small 8-bit number (a byte) and properly expand it to fit in a 32-bit 
    // register while preserving its sign (positive or negative).

    // W7: contains final sum
    // W8: holds value to add
    // SXTB - Sign extends a byte (8 bits) to 32 bits
    // Example: If byte is negative (MSB=1), extends with 1s, if positive extends with 0s
    MOV W7, #0x5A          // W7 = 0x5A (positive number)
    MOV W8, #0xFF          // W8 = 0xFF (negative number as byte, -1 in two's complement)
    // When we SXTB W8, 0xFF becomes 0xFFFFFFFF (sign extended)
    // 0x5A + 0xFFFFFFFF = 0x59 (90 + -1 = 89)
    ADD W7, W7, W8, SXTB   // Sign extend W8 as byte then add to W7

    // ===========================
    // With register extension option: UXTH Extended halfword
    // ===========================
    // The UXTH (Unsigned eXTend Halfword) instruction in ARM64 assembly is a way to take
    // a small 16-bit number (a halfword) and expand it to fit in a 32-bit register
    // by zero-extending it. This means the upper 16 bits are filled with zeros,
    // treating the original value as an unsigned number.
    // W9: contains final sum
    // W10: holds value to add
    // UXTH - Zero extends a halfword (16 bits) to 32 bits
    // Example: Always extends with 0s regardless of sign
    MOV W9, #0x5A          // W9 = 0x5A
    MOV W10, #0xFFFF       // W10 = 0xFFFF (as halfword)
    // When we UXTH W10, 0xFFFF becomes 0x0000FFFF (zero extended)
    // 0x5A + 0x0000FFFF = 0x10059 
    ADD W9, W9, W10, UXTH  // Zero extend W10 as halfword then add to W9


    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
