AVR Assembler Instructions
==========================

INC - Increment
---------------

### Description:

Adds one -1- to the contents of register Rd and places the result in the destination register Rd.

The C flag in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> is not affected by the operation, thus allowing the INC instruction to be used on a loop counter in multiple-precision computations.

When operating on unsigned numbers, only <a href="avrassembler.wb_BREQ.html" class="xref" title="BREQ - Branch if Equal">BREQ</a> and <a href="avrassembler.wb_BRNE.html" class="xref" title="BRNE - Branch if Not Equal">BRNE</a> branches can be expected to perform consistently. When operating on two’s complement values, all signed branches are available.

Operation:

(i) Rd ← Rd + 1

Syntax: Operands: Program Counter:

(i) INC Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0011 |
```
### Status Register and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | -   |
```
S:N ⊕ V

For signed tests.

V:R7

${R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if two’s complement overflow resulted from the operation; cleared otherwise. Two’s complement overflow occurs if and only if Rd was $7F before the operation.

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; Cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
clr r22 ; clear r22
loop: inc r22 ; increment r22
...
cpi r22,$4F ; Compare r22 to $4f
brne loop ; Branch if not equal
nop ; Continue (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
