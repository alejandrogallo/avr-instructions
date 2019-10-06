AVR Assembler Instructions
==========================

BRTS - Branch if the T Flag is Set
----------------------------------

### <a href="" id="N13CE4"></a> Description:

Conditional relative branch. Tests the T flag and branches relatively to PC if T is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 6,k).

Operation:

If T = 1 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRTS k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k110 |

### <a href="" id="N13D1D"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
bst r3,5 ; Store bit 5 of r3 in T flag
brts tset ; Branch if this bit was set
...
tset:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
