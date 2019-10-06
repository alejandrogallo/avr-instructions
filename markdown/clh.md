AVR Assembler Instructions
==========================

CLH - Clear Half Carry Flag
---------------------------

### <a href="" id="N1446B"></a> Description:

Clears the Half Carry flag (H) in SREG (status register).

Operation:

(i) H ← 0

Syntax: Operands: Program Counter:

(i) CLH None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1101 | 1000 |

### <a href="" id="N1449E"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | 0   | -   | -   | -   | -   | -   |

H: 0

Half Carry flag cleared

Example:

``` programlisting
clh; Clear the Half Carry flag
```

Words: 1 (2 bytes)

Cycles: 1
