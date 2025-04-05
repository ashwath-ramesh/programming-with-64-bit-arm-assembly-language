//
// MOVN: Moves the bitwise NOT of an immediate value into a register. This is useful for loading
// negative numbers and complementary bit patterns efficiently.
// 

.global _start	            // Provide program starting address to linker

_start:
    B basic_moves           // Branch to section
    
basic_moves:
    MOVN    W1, #1      // binary=0b11111111111111111111111111111110 hex=0xFFFFFFFE

    B   exit            // Branch to exit

exit:
    MOV X8, #93     // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
