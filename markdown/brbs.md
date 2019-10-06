AVR Assembler Instructions
==========================

BRBS - Branch if Bit in SREG is Set
-----------------------------------

### <a href="" id="N12F85"></a> Description:

Conditional relative branch. Tests a single bit in SREG and branches relatively to PC if the bit is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form.

Operation:

If SREG(s) = 1 then PC ← PC + k + 1, else PC ← PC + 1

Syntax: Operands: Program Counter:

BRBS s,k 0 ≤ s ≤ 7, -64 ≤ k ≤ +63 PC &lt;- PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | ksss |

### <a href="" id="N12FBA"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
bstr 0,3 ; Load T bit with bit 3 of r0
brbs 6, bitset ; Branch T bit was set
...
bitset: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
