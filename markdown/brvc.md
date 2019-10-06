AVR Assembler Instructions
==========================

BRVC - Branch if Overflow Cleared
---------------------------------

### <a href="" id="N13DA9"></a> Description:

Conditional relative branch. Tests the Overflow flag (V) and branches relatively to PC if V is cleared. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 3,k).

Operation:

If V = 0 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRVC k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k011 |
```
### <a href="" id="N13DE2"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
add r3,r4 ; Add r4 to r3
brvc noover ; Branch if no overflow
...
noover:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
