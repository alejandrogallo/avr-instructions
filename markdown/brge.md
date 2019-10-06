AVR Assembler Instructions
==========================

BRGE - Branch if Greater or Equal Signed)
-----------------------------------------

### <a href="" id="N1335F"></a> Description:

Conditional relative branch. Tests the Signed flag (S) and branches relatively to PC if S is cleared. If the instruction is executed immediately after any of the instructions <a href="avrassembler.wb_CP.html" class="xref" title="CP- Compare">CP</a> , <a href="avrassembler.wb_CPI.html" class="xref" title="CPI- Compare with Immediate">CPI</a> , <a href="avrassembler.wb_SUB.html" class="xref" title="SUB- Subtract without Carry">SUB</a> or <a href="avrassembler.wb_SUBI.html" class="xref" title="SUBI- Subtract Immediate">SUBI</a> , the branch will occur if and only if the signed binary number represented in Rd was greater than or equal to the signed binary number represented in Rr. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 4,k).

Operation:

If Rd ≥ Rr (N ⊕ V = 0) then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRGE k k-64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k100 |

### <a href="" id="N133A8"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
    cp r11,r12 ; Compare registers r11 and r12
    brge greateq ; Branch if r11 ≥ r12 (signed)
    ...
    greateq: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
