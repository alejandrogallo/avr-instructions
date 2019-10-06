AVR Assembler Instructions
==========================

BRCS - Branch if Carry Set
--------------------------

### <a href="" id="N1310B"></a> Description:

Conditional relative branch. Tests the Carry flag (C) and branches relatively to PC if C is set. This instruction branches relatively to PC in either direction (PC - 63 ≤ destination ≤ PC + 64). The parameter k is the offset from PC and is represented in two’s complement form. (Equivalent to instruction <a href="avrassembler.wb_BRBS.html" class="xref" title="BRBS - Branch if Bit in SREG is Set">the section called “ BRBS - Branch if Bit in SREG is Set”</a> 0,k).

Operation:

If C = 1 then PC &lt;- PC + k + 1, else PC &lt;- PC + 1

Syntax: Operands: Program Counter:

BRCS k -64 ≤ k ≤ +63 PC &lt;- PC + k + 1

PC &lt;- PC + 1, if condition is false

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 00kk | kkkk | k000 |

### <a href="" id="N13143"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
cpi r26, $56 ; Compare r26 with $56
brcs carry ; Branch if carry set
...
carry: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false

2 if condition is true
