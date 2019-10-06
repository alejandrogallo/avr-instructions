AVR Assembler Instructions
==========================

SBR - Set Bits in Register
--------------------------

### <a href="" id="N18E66"></a> Description:

Sets specified bits in register Rd. Performs the logical <a href="avrassembler.wb_ORI.html" class="link" title="ORI- Logical OR with Immediate">ORI</a> between the contents of register Rd and constant mask K and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd v K

Syntax: Operands: Program Counter:

(i)SBR Rd,K 16&lt;=d&lt;=31, 0&lt;=K&lt;=255 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0110 | KKKK | dddd | KKKK |
```
### <a href="" id="N18E9D"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | -   |
```
S: N ⊕ V, For signed tests.

V:0

Cleared

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

R (Result) equals Rd after the operation.

Example:

``` programlisting
sbr r16,3 ; Set bits 0 and 1 in r16
sbr r17,$F0 ; Set 4 MSB in r17
```

Words: 1 (2 bytes)

Cycles: 1
