AVR Assembler Instructions
==========================

MUL - Multiply Unsigned
-----------------------

### <a href="" id="N171FA"></a> Description:

This instruction performs 8-bit × 8-bit → 16-bit unsigned multiplication.

| Rd           |     | Rr         |     | R1           | R0          |
|--------------|-----|------------|-----|--------------|-------------|
| Multiplicand | ×   | Multiplier | →   | Product High | Product Low |
| 8            |     | 8          |     | 16           |             |

The multiplicand Rd and the multiplier Rr are two registers containing unsigned numbers. The 16-bit unsigned product is placed in R1 (high byte) and R0 (low byte). Note that if the multiplicand or the multiplier is selected from R0 or R1 the result will overwrite those after multiplication.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i) R1:R0 ← Rd × Rr(unsigned ← unsigned × unsigned)

Syntax: Operands: Program Counter:

(i) MUL Rd,Rr 0 ≤ d ≤ 31, 0 ≤ r ≤ 31 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 11rd | dddd | rrrr |

### <a href="" id="N17291"></a> Status Register (SREG) and Boolean Formulae:

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
mul r5,r4 ; Multiply unsigned r5 and r4
movw r4,r0 ; Copy result back in r5:r4
```

Words: 1 (2 bytes)

Cycles: 2
