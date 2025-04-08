# Programming with 64 bit ARM assembly language

Based on the book: [Programming with 64-Bit ARM Assembly Language: Single Board Computer Development for Raspberry Pi and Mobile Devices](https://www.amazon.com/dp/1484258800/) by Stephen Smith.

## How To

```bash
OS: Ubuntu 22.04
```

Go to the directory of the topic you want to run.
```bash
# Build and run
make clean
# -B: forces rebuild
make -B DEBUG=1
# Run
gdb main
```

## Topics

### Theory
- Negative Numbers: 1's complement, 2's complement
- Big vs. Little Endian

### Loading & basic operations
- [MOV](mov) - Moves/copies a value into a register
- [MOVN](movn) - Moves the bitwise NOT of an immediate value into a register
- [MOVZ](movz) - Moves a 16-bit value into a register while keeping other bits
- [Bit Shifting using MOV](bit-shift-using-mov) - LSL, LSR, ASR, ROR
- [MOVK](movk) - Moves a 16-bit value into a register while keeping other bits
- [ADD](add) - Add two values
- [ADDS/ADC](adds-adc) - Adds two values and updates status flags, adds two values with carry
- Add two 192-bit values
- [SUB/SUBS/SBC](sub) - Subtracts one value from another value; sets status flags; subtracts with carry
- Subtract two 128-bit values

### Program flow
- [Comparison Instructions](cmp) - CMP, CMN, TST #TODO
- [Branch](branch): Unconditional Branch, Conditional Branch: EQ, NE, LT, GT
- Loops
  - [For Loop](for-loop)
  - [While Loop](while-loop)
  - [Do-While Loop](do-while-loop) #TODO
- [Select Case](select-case) #TODO
- [If/Then/Else](if-else)
- [Logical Operators](logic-ops): AND, EOR, ORR, BIC
- [Using Expressions in Immediate Constants](using-exps-imm)
- Convert Integers to ASCII
- Why Not Print in Decimal?

### Memory
- [Memory directives](mem-directives): .ascii, .byte, .word, .short, .long, .quad, .fill, .rept, .endr #TODO
- [LDR](ldr): Loads address / data from memory into a register
- [ADR](adr): Loads address into a register
- Indexing through memory: post indexing, pre indexing
- STR: Stores a register to memory
- [Storing a Register to Memory](strb) #TODO
- Double Registers


- SVC: Supervisor Call, triggers system calls for OS services
- Load data `.data`


## Reference

- https://www.arm.com/architecture/learn-the-architecture/a-profile
- https://developer.arm.com/documentation/102374/0102
- https://www.rapidtables.com/convert/number/hex-dec-bin-converter.html 
- Current Program Status Register (CPSR): https://developer.arm.com/documentation/ddi0601/2025-03/AArch32-Registers/CPSR--Current-Program-Status-Register
- Status flags and condition codes (NZCV): https://developer.arm.com/documentation/den0042/a/Unified-Assembly-Language-Instructions/Instruction-set-basics/Status-flags-and-condition-codes



------------------------------------------------------------------------------------------  

## Chapter 5: Thanks for the Memories

- Defining Memory Contents
  - Aligning Data
- Loading a Register with an Address
  - PC Relative Addressing
- Loading Data from Memory
  - Indexing Through Memory
- Storing a Register
- Double Registers
- Summary
- Exercises

## Chapter 6: Functions and the Stack

- Stacks on Linux
- Branch with Link
- Nesting Function Calls
- Function Parameters and Return Values
- Managing the Registers
- Summary of the Function Call Algorithm
- Upper-Case Revisited
- Stack Frames
  - Stack Frame Example
- Macros
  - Include Directive
  - Macro Definition
  - Labels
  - Why Macros?
  - Macros to Improve Code
- Summary
- Exercises

## Chapter 7: Linux Operating System Services

- So Many Services
- Calling Convention
  - Linux System Call Numbers
  - Return Codes
  - Structures
- Wrappers
- Converting a File to Upper-Case
  - Building .S Files
  - Opening a File
  - Error Checking
  - Looping
- Summary
- Exercises

## Chapter 8: Programming GPIO Pins

- GPIO Overview
- In Linux, Everything Is a File
- Flashing LEDs
- Moving Closer to the Metal
- Virtual Memory
- In Devices, Everything Is Memory
- Registers in Bits
  - GPIO Function Select Registers
  - GPIO Output Set and Clear Registers
- More Flashing LEDs
  - Root Access
  - Table Driven
  - Setting Pin Direction
  - Setting and Clearing Pins
- Summary
- Exercises

## Chapter 9: Interacting with C and Python

- Calling C Routines
  - Printing Debug Information
  - Adding with Carry Revisited
- Calling Assembly Routines from C
- Packaging Our Code
  - Static Library
  - Shared Library
- Embedding Assembly Code Inside C Code
- Calling Assembly from Python
- Summary
- Exercises

## Chapter 10: Interfacing with Kotlin and Swift

- About Kotlin, Swift, and Java
- Creating an Android App
  - Create the Project
  - XML Screen Definition
  - Kotlin Main Program
  - The C++ Wrapper
  - Building the Project
- Creating an iOS App
  - Create the Project
  - Adding Elements to the Main Storyboard
  - Adding Swift Code
  - Adding our Assembly Language Routine
  - Creating the Bridge
  - Building and Running the Project
- Tips for Optimizing Apps
- Summary
- Exercises

## Chapter 11: Multiply, Divide, and Accumulate

- Multiplication
  - Examples
- Division
  - Example
- Multiply and Accumulate
  - Vectors and Matrices
  - Accumulate Instructions
  - Example 1
- Summary
- Exercises

## Chapter 12: Floating-Point Operations

- About Floating-Point Numbers
  - About Normalization and NaNs
  - Recognizing Rounding Errors
- Defining Floating-Point Numbers
- About FPU Registers
- Defining the Function Call Protocol
- Loading and Saving FPU Registers
- Performing Basic Arithmetic
- Calculating Distance Between Points
- Performing Floating-Point Conversions
- Comparing Floating-Point Numbers
  - Example
- Summary
- Exercises

## Chapter 13: Neon Coprocessor

- About the NEON Registers
- Stay in Your Lane
- Performing Arithmetic Operations
- Calculating 4D Vector Distance
- Optimizing 3x3 Matrix Multiplication
- Summary
- Exercises

## Chapter 14: Optimizing Code

- Optimizing the Upper-Case Routine
  - Simplifying the Range Comparison
  - Using a Conditional Instruction
  - Restricting the Problem Domain
  - Using Parallelism with SIMD
- Tips for Optimizing Code
  - Avoiding Branch Instructions
  - Avoiding Expensive Instructions
  - Don't Be Afraid of Macros
  - Loop Unrolling
  - Keeping Data Small
  - Beware of Overheating
- Summary
- Exercises

## Chapter 15: Reading and Understanding Code

- Browsing Linux and GCC Code
  - Copying a Page of Memory
- Code Created by GCC
  - Using the CBNZ and CBZ Instructions
- Reverse Engineering and Ghidra
- Summary
- Exercises

## Chapter 16: Hacking Code

- Buffer Overrun Hack
- Causes of Buffer Overrun
- Stealing Credit Card Numbers
  - Stepping Through the Stack
- Mitigating Buffer Overrun Vulnerabilities
  - Don't Use strcpy
  - PIE Is Good
  - Poor Stack Canaries Are the First to Go
  - Preventing Code Running on the Stack
- Trade-offs of Buffer Overflow Mitigation Techniques
- Summary
- Exercises
