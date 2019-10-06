AVR Assembler Instructions
==========================

ANDI - Logical AND with Immediateand
------------------------------------

### <a href="" id="N12ABD"></a> Description:

Performs the logical AND between the contents of register Rd and a constant and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd • K

Syntax: Operands: Program Counter:

(i)ANDI Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0111 | KKKK | dddd | KKKK |
```
### <a href="" id="N12AF0"></a> Status Register (SREG) and Boolean Formulae:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | -   |
```
S: N ⊕ V, For signed tests.

V:0 Cleared

N:R7 Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
  andi r17,$0F ; Clear upper nibble of r17
  andi r18,$10 ; Isolate bit 4 in r18
  andi r19,$AA ; Clear odd bits of r19
  
```

Words: 1 (2 bytes)

Cycles: 1
