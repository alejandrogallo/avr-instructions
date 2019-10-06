AVR Assembler Instructions
==========================

BRID - Branch if Global Interrupt is Disabled
---------------------------------------------

### <a href="" id="N135BE"></a> Description:

Conditional relative branch. Tests the Global Interrupt flag (I) and branches relatively to PC if I is cleared. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 7,k).

Operation:

If I = 0 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRID k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k111 |

### <a href="" id="N135F7"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
brid intdis ; Branch if interrupt disabled
...
intdis:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
