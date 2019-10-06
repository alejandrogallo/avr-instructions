AVR Assembler Instructions
==========================

COM - One’s Complement
----------------------

### <a href="" id="N14A6F"></a> Description:

This instruction performs a one’s complement of register Rd.

Operation:

Rd ← $FF - Rd

Syntax: Operands: Program Counter:

COM Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0000 |
```
### <a href="" id="N14A96"></a> Status Register (SREG) and Boolean Formulae:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | 1   |
```
S:N ⊕ V For signed tests.

V:0 Cleared.

N:R7 Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; Cleared otherwise.

C:1 Set.

R (Result) equals Rd after the operation.

Example:

``` programlisting
com r4 ; Take one's complement of r4
breq zero ; Branch if zero
...
zero: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
