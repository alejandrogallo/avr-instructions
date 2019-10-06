AVR Assembler Instructions
==========================

MULS - Multiply Signed
----------------------

### <a href="" id="N17403"></a> Description:

This instruction performs 8-bit × 8-bit → 16-bit signed multiplication.

```
| Rd           |     | Rr         |     | R1           | R0          |
|--------------|-----|------------|-----|--------------|-------------|
| Multiplicand | ×   | Multiplier | →   | Product High | Product Low |
| 8            |     | 8          |     | 16           |             |
```
The multiplicand Rd and the multiplier Rr are two registers containing signed numbers. The 16-bit signed product is placed in R1 (high byte) and R0 (low byte).

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)R1:R0 ← Rd × Rr(signed ← signed × signed)

Syntax: Operands: Program Counter:

(i)MULS Rd,Rr 16 ≤ d ≤ 31, 16 ≤ r ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 0010 | dddd | rrrr |
```
### <a href="" id="N1749A"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | ⇔   | ⇔   |
```
C: R15

Set if bit 15 of the result is set; cleared otherwise.

Z:

$\\overline{R15} \\overline{R14} \\overline{R13} \\overline{R12}$

$\\overline{R11} \\overline{R10} \\overline{R9} \\overline{R8}$

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $0000; cleared otherwise.

R (Result) equals R1,R0 after the operation.

Example:

``` programlisting
muls r21,r20 ; Multiply signed r21 and r20
movw r20,r0 ; Copy result back in r21:r20
```

Words: 1 (2 bytes)

Cycles: 2
