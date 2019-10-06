AVR Assembler Instructions
==========================

FMUL - Fractional Multiply Unsigned
-----------------------------------

### <a href="" id="N1579B"></a> Description:

This instruction performs 8-bit × 8-bit → 16-bit unsigned multiplication and shifts the result one bit left.

Rd

Rr

R1

R0

Multiplicand

×

Multiplier

-&gt;

Product High

Product Low

8

8

16

Let (N.Q) denote a fractional number with N binary digits left of the radix point, and Q binary digits right of the radix point. A multiplication between two numbers in the formats (N1.Q1) and (N2.Q2) results in the format ((N1+N2).(Q1+Q2)). For signal processing applications, the format (1.7) is widely used for the inputs, resulting in a (2.14) format for the product. A left shift is required for the high byte of the product to be in the same format as the inputs. The FMUL instruction incorporates the shift operation in the same number of cycles as MUL.

The (1.7) format is most commonly used with signed numbers, while FMUL performs an unsigned multiplication. This instruction is therefore most useful for calculating one of the partial products when performing a signed multiplication with 16-bit inputs in the (1.15) format, yielding a result in the (1.31) format. Note: the result of the FMUL operation may suffer from a 2’s complement overflow if interpreted as a number in the (1.15) format. The MSB of the multiplication before shifting must be taken into account, and is found in the carry bit. See the following example.

The multiplicand Rd and the multiplier Rr are two registers containing unsigned fractional numbers where the implicit radix point lies between bit 6 and bit 7. The 16-bit unsigned fractional product with the implicit radix point between bit 14 and bit 15 is placed in R1 (high byte) and R0 (low byte).

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

R1:R0 ← Rd × Rr(unsigned (1.15) ← unsigned (1.7) × unsigned (1.7))

Syntax: Operands: Program Counter:

FMUL Rd,Rr 16 ≤ d ≤ 23, 16≤ r ≤ 23 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0000 | 0011 | 0ddd | 1rrr |

### <a href="" id="N15837"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | ⇔   | ⇔   |

C: R16

Set if bit 15 of the result before left shift is set; cleared otherwise.

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
;*Signed fractional multiply of two 16-bit numbers with 32-bit result.
;* USAGE
;*r19:r18:r17:r16 = ( r23:r22 * r21:r20 ) << 1
 ;******************************************************************************
fmuls16x16_32: clr r2
fmuls r23, r21 ;((signed)ah * (signed)bh) << 1
movw r19:r18, r1:r0
fmul r22, r20 ;(al * bl) << 1
adc r18, r2
movw r17:r16, r1:r0
fmulsu r23, r20 ;((signed)ah * bl) << 1
sbc r19, r2
add r17, r0
adc r18, r1
adc r19, r2
fmulsu r21, r22 ;((signed)bh * al) << 1
sbc r19, r2
add r17, r0
adc r18, r1
adc r19, r2
```

Words: 1 (2 bytes)

Cycles: 2
