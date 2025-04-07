//
// SUB: Subtracts one value from another value
// 

.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section
    
basics:
    // ===========================
    // SUB - Basic subtraction
    // ===========================
    // W1: contains final result
    // W2: holds value to subtract from
    MOV W2, #10
    SUB W1, W2, #3          // W1 = 10 - 3 = 7

    // ===========================
    // SUBS - Subtract and set flags
    // ===========================
    // W5: contains final result
    // W6: holds value to subtract from
    MOV W6, #5
    SUBS W5, W6, #10        // W5 = 5 - 10 = -5, sets N flag

    // ===========================
    // SBC - Subtract with carry
    // ===========================
    // For 128-bit subtraction
    MOV X7, #0xFFFFFFFFFFFFFFFF
    MOV X8, #0x1
    SUBS X9, X7, X8         // Lower 64 bits
    SBC X10, XZR, XZR       // Upper 64 bits with borrow

    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
