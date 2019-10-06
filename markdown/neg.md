AVR Assembler Instructions
==========================

NEG - Two’s Complement
----------------------

### <a href="" id="N17815"></a> Description:

Replaces the contents of register Rd with its two’s complement; the value $80 is left unchanged.

Operation:

(i)Rd ← $00 - Rd

Syntax: Operands: Program Counter:

(i) NEG Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0001 |
```
### <a href="" id="N17848"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
H:R3 + Rd3

Set if there was a borrow from bit 3; cleared otherwise

S:N ⊕ V

For signed tests.

V:

${R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if there is a two’s complement overflow from the implied subtraction from zero; cleared otherwise. A two’s complement overflow will occur if and only if the contents of the Register after operation (Result) is $80.

N: R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; Cleared otherwise.

C:R7 + R6 + R5 + R4 + R3 + R2 + R1 + R0

Set if there is a borrow in the implied subtraction from zero; cleared otherwise. The C flag will be set in all cases except when the contents of Register after operation is $00.

R (Result) equals Rd after the operation.

Example:

``` programlisting
sub r11,r0 ; Subtract r0 from r11
brpl positive ; Branch if result positive
neg r11 ; Take two's complement of r11
positive: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
