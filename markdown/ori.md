AVR Assembler Instructions
==========================

ORI - Logical OR with Immediate
-------------------------------

### <a href="" id="N17BBC"></a> Description:

Performs the logical OR between the contents of register Rd and a constant and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd v K

Syntax: Operands: Program Counter:

(i)ORI Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0110 | KKKK | dddd | KKKK |
```
### <a href="" id="N17BEF"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | -   |
```
S: N ⊕ V, For signed tests.

V:0

Cleared

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
ori r16,$F0 ; Set high nibble of r16
ori r17,1 ; Set bit 0 of r17
```

Words: 1 (2 bytes)

Cycles: 1
