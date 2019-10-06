AVR Assembler Instructions
==========================

BRNE - Branch if Not Equal
--------------------------

### <a href="" id="N139B0"></a> Description:

Conditional relative branch. Tests the Zero flag (Z) and branches relatively to PC if Z is cleared. If the instruction is executed immediately after any of the instructions <a href="avrassembler.wb_CP.html" class="xref" title="CP- Compare">CP</a> , <a href="avrassembler.wb_CPI.html" class="xref" title="CPI- Compare with Immediate">CPI</a> , <a href="avrassembler.wb_SUB.html" class="xref" title="SUB- Subtract without Carry">SUB</a> or <a href="avrassembler.wb_SUBI.html" class="xref" title="SUBI- Subtract Immediate">SUBI</a> , the branch will occur if and only if the unsigned or signed binary number represented in Rd was not equal to the unsigned or signed binary number represented in Rr. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 1,k).

Operation:

If Rd ≠ Rr (Z = 0) then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRNE k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k001 |

### <a href="" id="N139F9"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
eor r27,r27 ; Clear r27
loop:inc r27 ; Increase r27
...
cpir27,5 ; Compare r27 to 5
brneloop ; Branch if r27⇔5
nop ; Loop exit (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
