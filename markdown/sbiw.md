AVR Assembler Instructions
==========================

SBIW - Subtract Immediate from Word
-----------------------------------

### <a href="" id="N18C8B"></a> Description:

Subtracts an immediate value (0-63) from a register pair and places the result in the register pair. This instruction operates on the upper four register pairs, and is well suited for operations on the pointer registers.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)Rd+1:Rd ← Rd+1:Rd - K

Syntax: Operands: Program Counter:

(i)SBIW Rd+1:Rd,K d E {24,26,28,30}, 0 ≤ K ≤ 63 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0111 | KKdd | KKKK |
```
### <a href="" id="N18CC0"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
S: N ⊕ V, For signed tests.

V:

${Rdh7} \\overline{R15}$

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

$\\overline{Rdh7} {R15}$

Set if the absolute value of K is larger than the absolute value of Rd; cleared otherwise.

R (Result) equals Rdh:Rdl after the operation (Rdh7-Rdh0 = R15-R8, Rdl7-Rdl0=R7-R0).

Example:

``` programlisting
sbiw r25:r24,1 ; Subtract 1 from r25:r24
sbiw YH:YL,63 ; Subtract 63 from the Y pointer(r29:r28)
```

Words: 1 (2 bytes)

Cycles: 2
