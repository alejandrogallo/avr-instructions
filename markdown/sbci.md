AVR Assembler Instructions
==========================

SBCI - Subtract Immediate with Carry
------------------------------------

### <a href="" id="N1879A"></a> Description:

Subtracts a constant from a register and subtracts with the C flag and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd - K - C

Syntax: Operands: Program Counter:

(i) SBCI Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0100 | KKKK | dddd | KKKK |
```
### <a href="" id="N187CD"></a> Status Register and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
$\\overline{Rd3} {Rr3} + {Rr3} {R3}+{R3} \\overline{Rd3}$

Set if there was a borrow from bit 3; cleared otherwise

S: N ⊕ V, For signed tests.

V:

${Rd7}{Rd7} \\overline{Rr7} \\overline{R7} + \\overline{Rd7} {Rr7} {R7}$

Set if two’s complement overflow resulted from the operation; cleared otherwise.

N: R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0} Z$

Z

Previous value remains unchanged when the result is zero; cleared otherwise.

C:

$\\overline{Rd7} {Rr7} + {Rr7} {R7} + {R7} \\overline{Rd7}$

Set if the absolute value of the constant plus previous carry is larger than the absolute value of Rd; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
; Subtract $4F23 from r17:r16
subi r16,$23 ; Subtract low byte
sbci r17,$4F ; Subtract with carry high byte
```

Words: 1 (2 bytes)

Cycles: 1
