//
// ADDS: Adds two values and updates status flags
// ADC: Adds two values with carry from previous ADDS instruction
// Run program in non-gdb mode and then get result using `echo $?`
// References:
// - Current Program Status Register (CPSR): https://developer.arm.com/documentation/ddi0601/2025-03/AArch32-Registers/CPSR--Current-Program-Status-Register
// - Status flags and condition codes (NZCV): https://developer.arm.com/documentation/den0042/a/Unified-Assembly-Language-Instructions/Instruction-set-basics/Status-flags-and-condition-codes
//

.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section
    
basics:
    // Adds 1 to X0 and updates status flags (N,Z,C,V)
    // Use gdb cmd: `watch $cpsr` to view NZCV flags change
    
    // Add two 128-bit numbers
    //  128-bit number representation:
    //  +------------------------+------------------------+
    //  |          X2           |          X3           |  First number
    //  | (higher 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+
    //  |          X4           |          X5           |  Second number
    //  | (higher 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+
    //  |          X0           |          X1           |  Result
    //  | (higher 64 bits)      | (lower 64 bits)       |
    //  +------------------------+------------------------+

    
    // First 64-bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
    MOV	X2, #0x0000000000000003
	MOV	X3, #0xFFFFFFFFFFFFFFFF	//Assembler will change to MOVN
    
    // Second 64-bit number is 0x00000000000000050000000000000001
	MOV	X4, #0x0000000000000005
	MOV X5, #0x0000000000000001

    // Set `watch $cpsr`
    // monitor CPSR using signed 32 bit conversion

    // Lower order words
    // Add 2 values and updates status flag
    // C & Z flags get set
	ADDS	X1, X3, X5

    // Higher order words
    // Add with carry from previous ADDS instruction
    // No new flags get set
	ADC	    X0, X2, X4

    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
