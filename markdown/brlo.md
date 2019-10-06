AVR Assembler Instructions
==========================

BRLO - Branch if Lower (Unsigned)
---------------------------------

### <a href="" id="N13748"></a> Description:

Conditional relative branch. Tests the Carry flag (C) and branches relatively to PC if C is set. If the instruction is executed immediately after any of the instructions <a href="avrassembler.wb_CP.html" class="xref" title="CP- Compare">CP</a> , <a href="avrassembler.wb_CPI.html" class="xref" title="CPI- Compare with Immediate">CPI</a> , <a href="avrassembler.wb_SUB.html" class="xref" title="SUB- Subtract without Carry">SUB</a> or <a href="avrassembler.wb_SUBI.html" class="xref" title="SUBI- Subtract Immediate">SUBI</a> , the branch will occur if and only if the unsigned binary number represented in Rd was smaller than the unsigned binary number represented in Rr. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 0,k).

Operation:

If Rd &lt; Rr (C = 1) then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRLO k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k000 |

### <a href="" id="N13791"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
eor r19,r19 ; Clear r19
loop:incr19 ; Increase r19
...
cpi r19,$10 ; Compare r19 with $10
brlo loop ; Branch if r19 < $10 (unsigned)
nop ; Exit from loop (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
