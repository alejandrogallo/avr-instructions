AVR Assembler Instructions
==========================

BLD - Bit Load from the T Flag in SREG to a Bit in Register.
------------------------------------------------------------

### <a href="" id="N12E07"></a> Description:

Copies the T flag in the SREG (status register) to bit b in register Rd.

Operation:

Rd(b) &lt;- T

Syntax: Operands: Program Counter:

BLD Rd,b 0 ≤ d ≤ 31, 0 ≤ b ≤ 7 PC &lt;- PC + 1

16 bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 100d | dddd | 0bbb |

### <a href="" id="N12E3A"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
    ; Copy bit
    bst r1,2 ; Store bit 2 of r1 in T flag
    bld r0,4 ; Load T flag into bit 4 of r0
    
```

Words: 1 (2 bytes)

Cycles: 1
