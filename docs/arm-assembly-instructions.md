# ARM assembly instructions

## CPU registers
- ARM processor operates on: load-store architecture
- How an instruction cycle works:
    - load data from memory into register
    - operate on 1/n registers and store value in another register
    - save this data from this register back to memory
- Registers are close to CPU and are faster than accessing memory where all data, program, functions are stored
- Lots of steps to perform 1 instruction!
- What is available to user:
    - general purpose registers: 31. X0-X30
    - SP/XZR: stack pointer or zero register
    - X30, LR: link register. if i call a fucntion, then return address is stored here. Avoid using this for other things.
    - pc: program counter. to store address of currently executing instruction.
- W0-W30, Wzr: use only lower 32 bits. not all 64 bits. upper 32 bits are set to 0. 

## ARM instruction format
## Computer Memory
