//
// B: Branch to a label unconditionally
// CMP: Compares two values and updates status flags (N,Z,C,V) for conditional branching
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    
    // ===========================
    // B.EQ - Branch if Equal
    // ===========================
    MOV W1, #5
    MOV W2, #5
    CMP W1, W2             // Compare W1 and W2
    B.EQ equal_case        // Branch if equal
    MOV W0, #0             // Not equal case
    B continue1

equal_case:
    MOV W0, #1             // Equal case

continue1:

    // ===========================
    // B.NE - Branch if Not Equal  
    // ===========================
    MOV W3, #10
    MOV W4, #20  
    CMP W3, W4             // Compare W3 and W4
    B.NE not_equal_case    // Branch if not equal
    MOV W5, #0             // Equal case
    B continue2

not_equal_case:
    MOV W5, #1             // Not equal case

continue2:

    // ===========================
    // B.LT - Branch if Less Than
    // ===========================
    MOV X4, #12            // Load 12 into X4
    MOV X5, #13            // Load 13 into X5
    CMP X4, X5             // Compare X4 and X5
    B.LT less_than         // Branch to less_than if X4 < X5
    MOV W5, #0             // Not less than case - set W5 to 0
    B continue3            // Branch to continue3

less_than:
    MOV W5, #1             // Less than case - set W5 to 1

continue3:

    // ===========================
    // B.GT - Branch if Greater than
    // ===========================
    MOV X6, #19            // Load 19 into X6
    MOV X7, #13            // Load 13 into X7
    CMP X6, X7             // Compare X6 and X7
    B.GT greater_than      // Branch to greater_than if X6 > X7
    MOV W5, #0             // Not greater than case - set W5 to 0
    B continue4            // Branch to continue4

greater_than:
    MOV W5, #1

continue4:
    
    B   exit                // Branch to exit

exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
