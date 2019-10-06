AVR Assembler Instructions
==========================

BRHS - Branch if Half Carry Flag is Set
---------------------------------------

### <a href="" id="N134F9"></a> Description:

Conditional relative branch. Tests the Half Carry flag (H) and branches relatively to PC if H is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 5,k).

Operation:

If H = 1 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRHS k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k101 |
```
### <a href="" id="N13532"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
brhs hset ; Branch if half carry flag set
...
hset: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
