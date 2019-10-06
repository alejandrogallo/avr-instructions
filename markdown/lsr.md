AVR Assembler Instructions
==========================

LSR - Logical Shift Right
-------------------------

### Description:

Shifts all bits in Rd one place to the right. Bit 7 is cleared. Bit 0 is loaded into the C flag of the <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> . This operation effectively divides an unsigned value by two. The C flag can be used to round the result.

Operation:

|     |     |            |     |     |
|-----|-----|------------|-----|-----|
| 0   | →   | b7——————b0 | →   | C   |

Syntax: Operands: Program Counter:

(i) LSR Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0110 |

### Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | 0   | ⇔   | ⇔   |

S: N ⊕ V, For signed tests.

V: N ⊕ C (For N and C after the shift)

N: 0

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C: Rd0

Set if, before the shift, the LSB of Rd was set; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
add r0,r4 ; Add r4 to r0
lsr r0 ; Divide r0 by 2
```

Words: 1 (2 bytes)

Cycles: 1
