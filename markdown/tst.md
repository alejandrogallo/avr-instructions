AVR Assembler Instructions
==========================

TST - Test for Zero or Minus
----------------------------

### <a href="" id="N1A4B4"></a> Description:

Tests if a register is zero or negative. Performs a logical AND between a register and itself. The register will remain unchanged.

Operation:

(i)Rd ← Rd • Rd

Syntax: Operands: Program Counter:

(i)TST Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode: (see AND Rd, Rd)

|      |      |      |      |
|------|------|------|------|
| 0010 | 00dd | dddd | dddd |

### <a href="" id="N1A4E7"></a> Status Register and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | -   |

S: N ⊕ V, For signed tests.

V:0

Cleared

N:R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

R (Result) equals Rd.

Example:

``` programlisting
tst r0 ; Test r0
breq zero ; Branch if r0=0
...
zero: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
