AVR Assembler Instructions
==========================

DEC - Decrement
---------------

### <a href="" id="N15211"></a> Description:

Subtracts one -1- from the contents of register Rd and places the result in the destination register Rd.

The C flag in SREG is not affected by the operation, thus allowing the DEC instruction to be used on a loop counter in multiple-precision computations.

When operating on unsigned values, only <a href="avrassembler.wb_BREQ.html" class="xref" title="BREQ - Branch if Equal">BREQ</a> and <a href="avrassembler.wb_BRNE.html" class="xref" title="BRNE - Branch if Not Equal">BRNE</a> branches can be expected to perform consistently. When operating on two’s complement values, all signed branches are available.

Operation:

Rd ← Rd - 1

Syntax: Operands: Program Counter:

DEC Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 1010 |

### <a href="" id="N15250"></a> Status Register and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | -   |

S:N ⊕ V

For signed tests.

V:

$\\overline{R7} {R6} {R5} {R4}$

*R*3*R*2*R*1*R*0

Set if two’s complement overflow resulted from the operation; cleared otherwise. Two’s complement overflow occurs if and only if Rd was $80 before the operation.

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; Cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
ldi r17, $10 ; Load constant in r17
loop: add r1, r2 ; Add r2 to r1
dec r17 ; Decrement r17
brne loop ; Branch if r17⇔0
nop; Continue (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
