AVR Assembler Instructions
==========================

BRVS - Branch if Overflow Set
-----------------------------

### <a href="" id="N13E6E"></a> Description:

Conditional relative branch. Tests the Overflow flag (V) and branches relatively to PC if V is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 3,k).

Operation:

If V = 1 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRVS k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k011 |

### <a href="" id="N13EA7"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
add r3,r4 ; Add r4 to r3
brvs overfl ; Branch if overflow
...
overfl:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
