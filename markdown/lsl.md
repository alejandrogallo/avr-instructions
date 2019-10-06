AVR Assembler Instructions
==========================

LSL - Logical Shift Left
------------------------

### Description:

Shifts all bits in Rd one place to the left. Bit 0 is cleared. Bit 7 is loaded into the C flag of the <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> . This operation effectively multiplies signed and unsigned values by two.

Operation:

```
|     |     |            |     |     |
|-----|-----|------------|-----|-----|
| C   | ←   | b7——————b0 | ←   | 0   |
```
Syntax: Operands: Program Counter:

(i) LSL Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode: (see ADD Rd,Rd)

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 11dd | dddd | dddd |
```
### Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
H: Rd3

S: N ⊕ V, For signed tests.

V: N ⊕ C (For N and C after the shift)

N: R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C: Rd7

Set if, before the shift, the MSB of Rd was set; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
add r0, r4 ; Add r4 to r0
lsl r0 ; Multiply r0 by 2
```

Words: 1 (2 bytes)

Cycles: 1
