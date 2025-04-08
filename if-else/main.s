//
// Demonstrates basic if then else using branch instructions
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // If-then-else: Demonstrates basic if-then-else control flow
    // ===========================
    // if (x > 5) {
    //     y = 1;
    // } else {
    //     y = 2;
    // }
    // Register X1 contains value of x
    // Register X2 contains value of y
    
    
    MOV X1, #4              // Set x = 4
    CMP X1, #5              // Compare x with 5
    B.GT condif             // If x > 5, branch to then_block
    MOV X2, #2
    B exit

condif:
    MOV X2, #1
    B exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
