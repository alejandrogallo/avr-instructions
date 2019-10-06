AVR Assembler Instructions
==========================

OR - Logical OR
---------------

### <a href="" id="N17A80"></a> Description:

Performs the logical OR between the contents of register Rd and register Rr and places the result in the destination register Rd.

Operation:

(i)Rd ← Rd v Rr

Syntax:Operands:Program Counter:

(i)OR Rd,Rr0 ≤ d ≤ 31, 0 ≤ r ≤ 31PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 0010 | 10rd | dddd | rrrr |

### <a href="" id="N17AB3"></a> Status Register (SREG) and Boolean Formula:

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

R (Result) equals Rd after the operation.

Example:

``` programlisting
or r15,r16 ; Do bitwise or between registers
bst r15,6 ; Store bit 6 of r15 in T flag
brts ok ; Branch if T flag set
...
ok: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
