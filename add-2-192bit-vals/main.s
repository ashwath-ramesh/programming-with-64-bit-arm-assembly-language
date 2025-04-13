//
// Add 2 192-bit values
// ADDS: Adds two values and updates status flags
// ADC: Adds two values with carry from previous ADDS instruction
//

.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section
    
basics:
    // Add 2 192-bit values
    // 192-bit number representation
    //  +------------------------+------------------------+------------------------+
    //  |          X2           |          X3           |          X4           |  First number
    //  | (highest 64 bits)     | (middle 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+------------------------+
    //  |          X5           |          X6           |          X7           |  Second number
    //  | (highest 64 bits)     | (middle 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+------------------------+
    //  |          X0           |          X1           |          X8           |  Result
    //  | (highest 64 bits)     | (middle 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+------------------------+

    // 192-bit numbers in hex:
    // First number:  0x0000000000000003 FFFFFFFFFFFFFFFF 0000000000000001
    // Second number: 0x0000000000000005 0000000000000001 00000000000000FF
    // Result:        0x0000000000000009 0000000000000000 0000000000000100

    // Move lower 64 bits for each number
    MOV X4, #0x0000000000000001     // #1
    MOV X7, #0x00000000000000FF     // #2

    // Move middle 64 bits for each number
    MOV X3, #0xFFFFFFFFFFFFFFFF     // #1
    MOV X6, #0x0000000000000001     // #2
    
    // Move highest 64-bit for each number
    MOV	X2, #0x0000000000000003     // #1
	MOV	X5, #0x0000000000000005	    // #2
    
	// Add
    ADDS	X8, X4, X7
    ADDS	X1, X3, X6
    ADC	    X0, X2, X5

    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
