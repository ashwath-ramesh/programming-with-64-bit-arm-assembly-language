//
// MOV: Moves/copies a value into a register
// Key concepts:
// - MOV is an alias for other instructions like ORR and ADD with special operands
// - Immediate values (constants) can be moved directly into registers
// - Immediate values are typically limited to 16 bits (0-65535), but ARM64 has special
//   encoding that allows some larger values through bit shifting and masking
// - Values can be copied between registers (both general purpose and special registers)
// - Special registers include XZR (zero register), SP (stack pointer), and WZR (32-bit zero)
// - For large constants that can't be encoded as immediates:
//   - MOVZ: Move with zeros (sets upper bits to 0)
//   - MOVK: Move keeping existing bits
//   - MOVN: Move inverted value (bitwise NOT)
//

.global _start	            // Provide program starting address to linker

_start:
    B basic_moves           // Branch to section
    
basic_moves:
    // ===========================
    // Immediate constant moves - Copy decimal constant values directly into registers
    // ===========================
    
    // Move decimal 3 to 64-bit register X0
    MOV X0, #3

    // Move decimal 5 to 32-bit register W1
    MOV W1, #5

    // Moving between 32-bit (W) and 64-bit (X) registers
    MOV W11, W1           // 32-bit move, upper bits are zeroed
    MOV X12, X11          // Moving from 32-bit to 64-bit preserves value

    // ===========================
    // Immediate constant moves - Copy hexadecimal constant values directly into registers
    // ===========================
    MOV X2, #0xAF

    B immediate_limits      // Branch to section

immediate_limits:    
    // ===========================
    // Testing increasing immediate values with MOV
    // Purpose: Show how even though MOV can only take 16-bit immediate values directly,
    // ARM64 uses special encoding to allow certain larger values through bit shifting
    // and masking. This section demonstrates which larger values are allowed.
    // ===========================

    // 16 bits (works)
    MOV X5, #0xFFFF       // 65,535 (maximum 16-bit value) = 0b1111111111111111

    // 17 bits
    MOV X5, #0x10000      // 65,536 = 0b10000000000000000
    MOV X5, #0x1FFFF      // 131,071 = 0b11111111111111111

    // 18 bits
    MOV X5, #0x20000      // 131,072 = 0b100000000000000000
    MOV X5, #0x3FFFF      // 262,143 = 0b111111111111111111

    // 19 bits
    MOV X5, #0x40000      // 262,144 = 0b1000000000000000000
    MOV X5, #0x7FFFF      // 524,287 = 0b1111111111111111111

    // 20 bits
    MOV X5, #0x80000      // 524,288 = 0b10000000000000000000
    MOV X5, #0xFFFFF      // 1,048,575 = 0b11111111111111111111

    // 21 bits
    MOV X5, #0x100000     // 1,048,576 = 0b100000000000000000000
    MOV X5, #0x1FFFFF     // 2,097,151 = 0b111111111111111111111

    // Testing some larger jumps
    MOV X5, #0x400000     // 4,194,304 = 0b10000000000000000000000
    MOV X5, #0x800000     // 8,388,608 = 0b100000000000000000000000
    MOV X5, #0x1000000    // 16,777,216 = 0b1000000000000000000000000

    // These will give an ERROR when assembling! 
    // Uncomment to see the errors.
    // MOV X5, #0x10001      // 65,537 = 0b10000000000000001
    // MOV X5, #0x10002      // 65,538 = 0b10000000000000010
    // MOV X5, #0x10003      // 65,539 = 0b10000000000000011
    // MOV X5, #0x10004      // 65,540 = 0b10000000000000100

    // Need to use MOVZ/MOVK combination for values > 16 bits
    // Will demonstrate this in the next program

    B register_moves        // Branch to section

register_moves:
    // ===========================
    // Register moves - Copy values between registers
    // ===========================
    // Basic register to register moves
    MOV X6, X5            // Copy value from X5 to X6
    
    // ===========================
    // Moving to/from special registers
    // ===========================
    // - XZR: special register that always contains zero. It exists to provide a constant zero value and
    // as a bit bucket (discarding values). Using XZR is more efficient than loading an immediate zero
    // since it doesn't require an actual instruction to load the value.
    // - SP: Stack Pointer register that holds the memory address of the current stack frame. The stack
    // is used for temporary storage of data and return addresses for function calls. SP should be
    // carefully managed since incorrect modifications can corrupt the program's execution stack.
    MOV X8, XZR           // Move zero register (XZR) to X8.
    MOV XZR, X8           // Move to zero register (value is discarded)
    MOV X9, SP            // Copy stack pointer to X9
    MOV SP, X10           // Set stack pointer (be careful!)

    B exit                  // Branch to section

exit:
    MOV X8, #93     // Service command code 93 terminates this program
    SVC 0           // Call linux to terminate the program
