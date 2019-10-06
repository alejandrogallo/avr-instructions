AVR Assembler Instructions
==========================

CLC - Clear Carry Flag
----------------------

### <a href="" id="N143AC"></a> Description:

Clears the Carry flag (C) in SREG (status register).

Operation:

C &lt;- 0

Syntax: Operands: Program Counter:

CLC None PC &lt;- PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1000 | 1000 |

### <a href="" id="N143DF"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | 0   |

C: 0 Carry flag cleared

Example:

``` programlisting
add r0, r0 ; Add r0 to itself
clc ; Clear carry flag
```

Words: 1 (2 bytes)

Cycles: 1
