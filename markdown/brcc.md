AVR Assembler Instructions
==========================

BRCC - Branch if Carry Cleared
------------------------------

### <a href="" id="N13046"></a> Description:

Conditional relative branch. Tests the Carry flag (C) and branches relatively to PC if C is cleared. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 0,k).

Operation:

If C = 0 then PC &lt;- PC + k + 1, else PC &lt;- PC + 1

Syntax: Operands: Program Counter:

BRCC k -64 ≤ k ≤ +63 PC &lt;- PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k000 |

### <a href="" id="N1307F"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
    add r22,r23 ; Add r23 to r22
    brcc nocarry ; Branch if carry cleared
     ...
    nocarry: nop ; Branch destination (do nothing)
    
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
