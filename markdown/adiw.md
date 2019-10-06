AVR Assembler Instructions
==========================

ADIW - Add Immediate to Word
----------------------------

### <a href="" id="N127A6"></a> Description:

Adds an immediate value (0-63) to a register pair and places the result in the register pair. This instruction operates on the upper four register pairs, and is well suited for operations on the pointer registers.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)Rd+1:Rd ← Rd+1:Rd + K

Syntax: Operands: Program Counter:

(i)ADIW Rd+1:Rd,K d E {24,26,28,30}, 0 &lt;= K &lt;= 63 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0110 | KKdd | KKKK |

### <a href="" id="N127DB"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

S: N ⊕ V, For signed tests.

V:

$\\overline{Rdh7} {R15}$

Set if two’s complement overflow resulted from the operation; cleared otherwise.

N: R15

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R15} \\overline{R14} \\overline{R13} \\overline{R12}$

$\\overline{R11} \\overline{R10} \\overline{R9} \\overline{R8}$

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $0000; cleared otherwise.

C:

$\\overline{R15} {Rdh7}$

Set if there was carry from the MSB of the result; cleared otherwise.

R (Result) equals Rdh:Rdl after the operation (Rdh7-Rdh0 = R15-R8, Rdl7-Rdl0=R7-R0).

Example:

``` programlisting
adiw r25:24,1 ; Add 1 to r25:r24
adiw ZH:ZL,63 ; Add 63 to the Z pointer(r31:r30)
```

Words: 1 (2 bytes)

Cycles: 2
