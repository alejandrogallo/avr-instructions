AVR Assembler Instructions
==========================

SUBI - Subtract Immediate
-------------------------

### <a href="" id="N1A208"></a> Description:

Subtracts a register and a constant and places the result in the destination register Rd. This instruction is working on Register R16 to R31 and is very well suited for operations on the X, Y and Z pointers.

Operation:

(i)Rd ← Rd - K

Syntax: Operands: Program Counter:

(i)SUBI Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0101 | KKKK | dddd | KKKK |

### <a href="" id="N1A23B"></a> Status Register and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

H:

$\\overline{Rd3} {K3} + {K3} {R3}+{R3} \\overline{Rd3}$

Set if there was a borrow from bit 3; cleared otherwise

S: N ⊕ V, For signed tests.

V:

${Rd7}{Rd7} \\overline{K7} \\overline{R7} + \\overline{Rd7} {K7} {R7}$

Set if two’s complement overflow resulted from the operation; cleared otherwise.

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C:

$\\overline{Rd7} {K7} + {K7} {R7} + {R7} \\overline{Rd7}$

Set if the absolute value of K is larger than the absolute value of Rd; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
subi r22,$11 ; Subtract $11 from r22
brne noteq ; Branch if r22⇔$11
 ...
 noteq: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
