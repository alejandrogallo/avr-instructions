AVR Assembler Instructions
==========================

BRBC - Branch if Bit in SREG is Cleared
---------------------------------------

### <a href="" id="N12EC4"></a> Description:

Conditional relative branch. Tests a single bit in SREG and branches relatively to PC if the bit is cleared. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form.

Operation:

If SREG(s) = 0 then PC &lt;- PC + k + 1, else PC &lt;- PC + 1

Syntax: Operands: Program Counter:

BRBC s, k 0 ≤ s ≤ 7, -64 ≤ k ≤ +63 PC &lt;- PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | ksss |

### <a href="" id="N12EF9"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
    cpi r20,5 ; Compare r20 to the value 5
    brbc 1,noteq ; Branch if zero flag cleared
    ...
    noteq:nop ; Branch destination (do nothing)
    
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
