//
// ADR: Loads address into a register
// ADR vs LDR:
// - ADR: Use for loading addresses within ±1MB of the current instruction
//   - More efficient for nearby addresses since it uses PC-relative addressing
//   - Limited range but faster execution
// - LDR: Use for loading addresses anywhere in memory
//   - Can load addresses beyond ±1MB range
//   - More flexible but slightly slower than ADR
//   - Required for loading large constants and accessing data section
//


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // ===========================
    // ADR: Loads address into a register
    // ===========================

    // ADR loads a PC-relative address into a register
    ADR X1, message         // Load address of message into X1
    MOV X2, #12            // Length of message
    MOV X0, #1             // 1 = StdOut
    MOV X8, #64            // Linux write system call
    SVC 0                  // Call Linux to output the string

.data
    message: .ascii "Hello World\n"
    
exit:
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program
    