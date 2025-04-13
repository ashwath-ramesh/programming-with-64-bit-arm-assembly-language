//
// Convert a string to all uppercase
// X0-X2: parameters to linux function services
// X3: address of output string
// X4: address of input string
// W5: current char being processed
// x8: linux function number
// 


.global _start	            // Provide program starting address to linker

_start:
    B basics                // Branch to section unconditionally

basics:
    // Load address of input & output strings
    LDR X4, =ipstr
    LDR X3, =opstr

loop: 
    // load data & inc address by 1 byte
    LDRB W5, [X4], #1

    CMP W5, #'z'
    B.GT cont

    CMP W5, #'a'
    B.LT cont

    SUB W5, W5, #('a'-'A')

cont:
    // store data & inc address by 1 byte
    STRB W5, [X3], #1
    CMP W5, #0              // stop on null char
    B.NE loop

print:
    // setup params to print hex number
    MOV X0, #1
    LDR X1, =opstr
    SUB X2, X3, X1

    // linux write system call
    MOV X8, #64
    // call linux
    SVC 0

    B exit

exit:
    MOV X0, #0
    MOV X8, #93             // Service command code 93 terminates this program
    SVC 0                   // Call linux to terminate the program

.data
    ipstr: .asciz "ashwath ramesh\n"
    opstr: .fill 255, 1, 0
