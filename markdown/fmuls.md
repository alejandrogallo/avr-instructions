AVR Assembler Instructions
==========================

FMULS - Fractional Multiply Signed
----------------------------------

### <a href="" id="N159A9"></a> Description:

This instruction performs 8-bit × 8-bit → 16-bit signed multiplication and shifts the result one bit left.

| Rd           |     | Rr         |       | R1           | R0          |
|--------------|-----|------------|-------|--------------|-------------|
| Multiplicand | ×   | Multiplier | -&gt; | Product High | Product Low |
| 8            |     | 8          |       | 16           |             |

Let (N.Q) denote a fractional number with N binary digits left of the radix point, and Q binary digits right of the radix point. A multiplication between two numbers in the formats (N1.Q1) and (N2.Q2) results in the format ((N1+N2).(Q1+Q2)). For signal processing applications, the format (1.7) is widely used for the inputs, resulting in a (2.14) format for the product. A left shift is required for the high byte of the product to be in the same format as the inputs. The FMULS instruction incorporates the shift operation in the same number of cycles as MULS.

The multiplicand Rd and the multiplier Rr are two registers containing signed fractional numbers where the implicit radix point lies between bit 6 and bit 7. The 16-bit signed fractional product with the implicit radix point between bit 14 and bit 15 is placed in R1 (high byte) and R0 (low byte).

Note that when multiplying 0x80 (-1) with 0x80 (-1), the result of the shift operation is 0x8000 (-1). The shift operation thus gives a two’s complement overflow. This must be checked and handled by software.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)R1:R0 ← Rd × Rr(signed (1.15) ← signed (1.7) × signed (1.7))

Syntax: Operands: Program Counter:

FMULS Rd,Rr 16 ≤ d ≤ 23, 16≤ r ≤ 23 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0000 | 0011 | 1ddd | 0rrr |

### <a href="" id="N15A44"></a> Status Register (SREG) and Boolean Formulae:

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
fmuls r23,r22 ; Multiply signed r23 and r22 in (1.7) format, result in (1.15) format
movw r23:r22,r1:r0 ; Copy result back in r23:r22
```

Words: 1 (2 bytes)

Cycles: 2
