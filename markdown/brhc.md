AVR Assembler Instructions
==========================

BRHC - Branch if Half Carry Flag is Cleared
-------------------------------------------

### <a href="" id="N13434"></a> Description:

Conditional relative branch. Tests the Half Carry flag (H) and branches relatively to PC if H is cleared. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBC.html" class="xref" title="BRBC - Branch if Bit in SREG is Cleared">BRBC</a> 5,k).

Operation:

If H = 0 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRHC k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1111 | 01kk | kkkk | k101 |
```
### <a href="" id="N1346D"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
brhc hclear ; Branch if half carry flag cleared
...
hclear: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
