AVR Assembler Instructions
==========================

SBC - Subtract with Carry
-------------------------

### <a href="" id="N185A7"></a> Description:

Subtracts two registers and subtracts with the C flag and places the result in the destination register Rd.

Operation:

(i) Rd ← Rd - Rr - C

Syntax: Operands: Program Counter:

(i) SBC Rd,Rr 0 ≤ d ≤ 31, 0 ≤ r ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 10rd | dddd | rrrr |
```
### <a href="" id="N185DA"></a> Status Register and Boolean Formula:

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

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0} Z$

Previous value remains unchanged when the result is zero; cleared otherwise.

C:

$\\overline{Rd7} {Rr7} + {Rr7} {R7} + {R7} \\overline{Rd7}$

Set if the absolute value of the contents of Rr plus previous carry is larger than the absolute value of the Rd; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
; Subtract r1:r0 from r3:r2
sub r2,r0 ; Subtract low byte
sbc r3,r1 ; Subtract with carry high byte
```

Words: 1 (2 bytes)

Cycles: 1
