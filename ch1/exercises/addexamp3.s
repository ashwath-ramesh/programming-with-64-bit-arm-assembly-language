// Example of addition of 2 192-bit numbers

.global _start

_start:
// First 192-bit number: 0x8F4A6D1B32C5E9710D83F267A95CB4E0F17D2863
    // High 64 bits: 0x8F4A6D1B32C5E971
    MOVZ X2, #0xE971            // Load lower 16 bits
    MOVK X2, #0x32C5, LSL #16   // Load next 16 bits
    MOVK X2, #0x6D1B, LSL #32   // Load next 16 bits
    MOVK X2, #0x8F4A, LSL #48   // Load highest 16 bits

    // Middle 64 bits: 0x0D83F267A95CB4E0
    MOVZ X3, #0xB4E0            // Load lower 16 bits
    MOVK X3, #0xA95C, LSL #16   // Load next 16 bits
    MOVK X3, #0xF267, LSL #32   // Load next 16 bits
    MOVK X3, #0x0D83, LSL #48   // Load highest 16 bits

    // Low 64 bits: 0xF17D2863
    MOVZ X4, #0x2863            // Load lower 16 bits
    MOVK X4, #0xF17D, LSL #16   // Load next 16 bits

// Second 192-bit number: 0x2C37E891D5AF46B83719A02E58F6DC471BA9C035
    // High 64 bits: 0x2C37E891D5AF46B8
    MOVZ X5, #0x46B8            // Load lower 16 bits
    MOVK X5, #0xD5AF, LSL #16   // Load next 16 bits
    MOVK X5, #0xE891, LSL #32   // Load next 16 bits
    MOVK X5, #0x2C37, LSL #48   // Load highest 16 bits

    // Middle 64 bits: 0x3719A02E58F6DC47
    MOVZ X6, #0xDC47            // Load lower 16 bits
    MOVK X6, #0x58F6, LSL #16   // Load next 16 bits
    MOVK X6, #0xA02E, LSL #32   // Load next 16 bits
    MOVK X6, #0x3719, LSL #48   // Load highest 16 bits

    // Low 64 bits: 0x1BA9C035
    MOVZ X7, #0xC035            // Load lower 16 bits
    MOVK X7, #0x1BA9, LSL #16   // Load next 16 bits

// Add lower 64-bits and set flag
    ADDS    X9, X4, X7
    ADCS    X10, X3, X6
    ADC     X11, X2, X5

exit:
    MOV     X8, #93     // Service command code 93 terminates this program
    SVC     0           // Call linux to terminate the program
