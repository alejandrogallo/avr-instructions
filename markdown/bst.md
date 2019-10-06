AVR Assembler Instructions
==========================

BST - Bit Store from Bit in Register to T Flag in SREG
------------------------------------------------------

### <a href="" id="N14000"></a> Description:

Stores bit b from Rd to the T flag in SREG (status register).

Operation:

T &lt;- Rd(b)

Syntax: Operands: Program Counter:

BST Rd,b 0 ≤ d ≤ 31, 0 ≤ b ≤ 7 PC &lt;- PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 101d | dddd | 0bbb |

### <a href="" id="N14033"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | ⇔   | -   | -   | -   | -   | -   | -   |

T:0 if bit b in Rd is cleared. Set to 1 otherwise.

Example:

``` programlisting
; Copy bit
bst r1,2 ; Store bit 2 of r1 in T flag
bld r0,4 ; Load T into bit 4 of r0
```

Words: 1 (2 bytes)

Cycles: 1
