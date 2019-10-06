AVR Assembler Instructions
==========================

BRMI - Branch if Minus
----------------------

### <a href="" id="N138E7"></a> Description:

Conditional relative branch. Tests the Negative flag (N) and branches relatively to PC if N is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">BRBS</a> 2,k).

Operation:

If N = 1 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRMI k -64 ≤ k ≤ +63 PC ← PC + k + 1

PC ← PC + 1, if condition is false

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k010 |
```
### <a href="" id="N13920"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

subi r18,4 ; Subtract 4 from r18

brmi negative ; Branch if result negative

…

negative: nop ; Branch destination (do nothing)

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
