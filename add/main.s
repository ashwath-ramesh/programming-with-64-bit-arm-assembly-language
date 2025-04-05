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

    // ===========================
    // Addition using 1 immediate value. Imm value can be 12-bits. Imm value is shifted before adding.
    // ===========================

    // ===========================
    // Addition of 2 registers
    // ===========================

    // ===========================
    // Addition of 2 registers, where one register's value is shifted before adding
    // ===========================

    // ===========================
    // With register extension option: SXTB Signed extended byte
    // ===========================

    // ===========================
    // With register extension option: UXTH Extended halfword
    // ===========================


    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
