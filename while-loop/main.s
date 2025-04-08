//
// Demonstrates basic while loop in ARM assembly using branch instructions
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // WHILE Loop: Increments X1 from 0 to 10 using a while loop
    // ===========================
    // while (i <= 10) {
    //     i++;
    // }
    
    MOV X1, #0

loop:
    ADD X1, X1, #1         // Add 1 to X1 and store value in X1
    CMP X1, #10
    B.LE loop


    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
