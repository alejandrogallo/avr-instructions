AVR Assembler Instructions
==========================

ADC - Add with Carry
--------------------

### <a href="" id="N123D9"></a> Description:

### <a href="" id="N123DB"></a> Adds two registers and the contents of the C flag and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd + Rr + C

Syntax: Operands: Program Counter:

(i)ADC Rd, Rr0 ≤ d ≤ 31, 0 ≤ r ≤ 31, PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0001 | 11rd | dddd | rrrr |

### <a href="" id="N1240C"></a> Status Register (SREG) Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

H:

${Rd3} {Rr3} + {Rr3} \\overline{R3}+\\overline{R3} {Rd3}$

Set if there was a carry from bit 3; cleared otherwise

S: N ⊕ V For signed tests.

V:

${Rd7}{Rd7} {Rr7} \\overline{R7} + \\overline{Rd7} \\overline{Rr7} {R7}$

Set if two’s complement overflow resulted from the operation; cleared otherwise.

N: R7 Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C:

${Rd7} {Rr7} + {Rr7} \\overline{R7} + \\overline{R7} {Rd7}$

Set if there was carry from the MSB of the result; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
  ; Add R1:R0 to R3:R2
  add r2,r0 ; Add low byte
  adc r3,r1 ; Add with carry high byte
  
```

Words: 1 (2 bytes)

Cycles: 1
