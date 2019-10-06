AVR Assembler Instructions
==========================

ROL - Rotate Left trough Carry
------------------------------

### <a href="" id="N182C7"></a> Description:

Shifts all bits in Rd one place to the left. The C flag is shifted into bit 0 of Rd. Bit 7 is shifted into the C flag. This operation, combined with <a href="avrassembler.wb_LSL.html" class="xref" title="LSL- Logical Shift Left">LSL</a> , effectively multiplies multi-byte signed and unsigned values by two.

Operation:

|     |     |            |     |     |
|-----|-----|------------|-----|-----|
| C   | ¨   | b7——————b0 | ←   | C   |

Syntax: Operands: Program Counter:

(i)ROL Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode: (see ADC Rd,Rd)

|      |      |      |      |
|------|------|------|------|
| 0001 | 11dd | dddd | dddd |

### <a href="" id="N18329"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

H: Rd3

S: N ⊕ V, For signed tests.

V: N ⊕ C (For N and C after the shift)

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C:Rd7

Set if, before the shift, the MSB of Rd was set; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
lsl r18 ; Multiply r19:r18 by two
rol r19 ; r19:r18 is a signed or unsigned two-byte integer
 brcsoneenc ; Branch if carry set
...
oneenc:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
