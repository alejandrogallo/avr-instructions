AVR Assembler Instructions
==========================

MULSU - Multiply Signed with Unsigned
-------------------------------------

### <a href="" id="N1760C"></a> Description:

This instruction performs 8-bit × 8-bit → 16-bit multiplication of a signed and an unsigned number.

| Rd           |     | Rr         |     | R1           | R0          |
|--------------|-----|------------|-----|--------------|-------------|
| Multiplicand | ×   | Multiplier | →   | Product High | Product Low |
| 8            |     | 8          |     | 16           |             |

The multiplicand Rd and the multiplier Rr are two registers. The multiplicand Rd is a signed number, and the multiplier Rr is unsigned. The 16-bit signed product is placed in R1 (high byte) and R0 (low byte).

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i) R1:R0 ← Rd × Rr(signed ← signed × unsigned)

Syntax: Operands: Program Counter:

(i) MULSU Rd,R r16 ≤ d ≤ 23, 16 ≤ r ≤ 23 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0000 | 0011 | 0ddd | 0rrr |

### <a href="" id="N176A3"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | ⇔   | ⇔   |

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
 ;******************************************************************************
 ;* DESCRIPTION
 ;*Signed multiply of two 16-bit numbers with 32-bit result.
 ;* USAGE
 ;*r19:r18:r17:r16 = r23:r22 * r21:r20
 ;******************************************************************************
 muls16x16_32:
clr r2
muls r23, r21 ; (signed)ah * (signed)bh
movw r19:r18, r1:r0
mul r22, r20; al * bl
movw r17:r16, r1:r0
mulsu r23, r20 ; (signed)ah * bl
sbc r19, r2
add r17, r0
adc r18, r1
adc r19, r2
mulsu r21, r22 ; (signed)bh * al
sbc r19, r2
add r17, r0
adc r18, r1
adc r19, r2
ret
```

Words: 1 (2 bytes)

Cycles: 2
