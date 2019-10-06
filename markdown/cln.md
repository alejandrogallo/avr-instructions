AVR Assembler Instructions
==========================

CLN - Clear Negative Flag
-------------------------

### <a href="" id="N145ED"></a> Description:

Clears the Negative flag (N) in SREG (status register).

Operation:

N ← 0

Syntax: Operands: Program Counter:

CLN None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1010 | 1000 |

### <a href="" id="N14620"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | 0   | -   | -   |

N: 0 Negative flag cleared

Example:

``` programlisting
add r2,r3 ; Add r3 to r2
cln ; Clear negative flag
```

Words: 1 (2 bytes)

Cycles: 1
