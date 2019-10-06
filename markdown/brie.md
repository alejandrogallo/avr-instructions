AVR Assembler Instructions
==========================

BRIE - Branch if Global Interrupt is Enabled
--------------------------------------------

### <a href="" id="N13683"></a> Description:

Conditional relative branch. Tests the Global Interrupt flag (I) and branches relatively to PC if I is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 7,k).

Operation:

If I = 1 then PC &lt;- PC + k + 1, else PC &lt;- PC + 1

Syntax: Operands: Program Counter:

BRIE k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k111 |
```
### <a href="" id="N136BC"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
brie inten ; Branch if interrupt enabled
...
inten:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
