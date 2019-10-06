AVR Assembler Instructions
==========================

CLT - Clear T Flag
------------------

### <a href="" id="N14832"></a> Description:

Clears the T flag in SREG (status register).

Operation:

T ← 0

Syntax: Operands: Program Counter:

CLT None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1110 | 1000 |

### <a href="" id="N14865"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | 0   | -   | -   | -   | -   | -   | -   |

T: 0 T flag cleared

Example:

``` programlisting
clt ; Clear T flag
```

Words: 1 (2 bytes)

Cycles: 1
