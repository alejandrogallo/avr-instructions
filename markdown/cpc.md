AVR Assembler Instructions
==========================

CPC - Compare with Carry
------------------------

### <a href="" id="N14D7E"></a> Description:

This instruction performs a compare between two registers Rd and Rr and also takes into account the previous carry. None of the registers are changed. All conditional branches can be used after this instruction.

Operation:

Rd - Rr - C

Syntax: Operands: Program Counter:

CPC Rd,Rr 0 ≤ d ≤ 31, 0 ≤ r ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 01rd | dddd | rrrr |
```
### <a href="" id="N14DB1"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
H:

$\\overline{Rd3} {Rr3} + {Rr3} {R3}+{R3} \\overline{Rd3}$

Set if there was a borrow from bit 3; cleared otherwise

S: N ⊕ V, For signed tests.

V:

${Rd7}{Rd7} \\overline{Rr7} \\overline{R7} + \\overline{Rd7} {Rr7} {R7}$

Set if two’s complement overflow resulted from the operation; cleared otherwise.

N:R7 Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0} Z$

Previous value remains unchanged when the result is zero; cleared otherwise.

C:

$\\overline{Rd7} {Rr7} + {Rr7} {R7} + {R7} \\overline{Rd7}$

Set if the absolute value of the contents of Rr plus previous carry is larger than the absolute value of Rd; cleared otherwise.

R (Result) after the operation.

Example:

``` programlisting
; Compare r3:r2 with r1:r0
cp r2,r0 ; Compare low byte
cpc r3,r1 ; Compare high byte
brne noteq ; Branch if not equal
...
noteq:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
