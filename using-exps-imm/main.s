//
// Demonstrates using an expression like #('A'-10) in immediate constant
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // Using expressions with ASCII numbers
    // ===========================
    
    // Load ASCII '5' by using expression #('0' + 5)
    MOV X1, #('0' + 5)     // X1 = '5' (ASCII value 0x35)
    
    // Load ASCII '9' directly 
    MOV X2, #'9'           // X2 = '9' (ASCII value 0x39)
    
    // Load ASCII '0' and add 3 to get '3'
    MOV X3, #'0'           // X3 = '0' (ASCII value 0x30)
    ADD X3, X3, #3         // X3 = '3' (ASCII value 0x33)

    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
