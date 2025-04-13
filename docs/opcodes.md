
# Instructions


```bash
// Move immediate value into destination register
MOV Xd, #imm
```

```bash
// Move value from source register to destination register
MOV Xd, Xs                        
```

```bash
// Load address of label into destination register
LDR Xd, =label        
```

```bash
// Store pair of registers to consecutive memory locations
// Store registers Xd1 and Xd2 to memory at address in Xa
STP Xd1, Xd2, [Xa]    
```

```bash
// Load pair of registers from consecutive memory locations
// Load registers Xd1 and Xd2 from memory at address in Xa
LDP Xd1, Xd2, [Xa]    
```
