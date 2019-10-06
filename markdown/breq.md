AVR Assembler Instructions
==========================

BREQ - Branch if Equal
----------------------

### <a href="" id="N1328A"></a> Description:

Conditional relative branch. Tests the Zero flag (Z) and branches relatively to PC if Z is set. If the instruction is executed immediately after any of the instructions <a href="avrassembler.wb_CP.html" class="xref" title="CP- Compare">CP</a> , <a href="avrassembler.wb_CPI.html" class="xref" title="CPI- Compare with Immediate">CPI</a> , <a href="avrassembler.wb_SUB.html" class="xref" title="SUB- Subtract without Carry">SUB</a> or <a href="avrassembler.wb_SUBI.html" class="xref" title="SUBI- Subtract Immediate">SUBI</a> , the branch will occur if and only if the unsigned or signed binary number represented in Rd was equal to the unsigned or signed binary number represented in Rr. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 1,k).

Operation:

If Rd = Rr (Z = 1) then PC &lt;- PC + k + 1, else PC &lt;- PC + 1

Syntax: Operands: Program Counter:

BREQ k -64 ≤ k ≤ +63 PC &lt;- PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k001 |

### <a href="" id="N132D3"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
cp r1, r0 ; Compare registers r1 and r0
breq equal ; Branch if registers equal
...
equal: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
