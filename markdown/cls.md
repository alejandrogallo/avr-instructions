AVR Assembler Instructions
==========================

CLS - Clear Signed Flag
-----------------------

### <a href="" id="N14773"></a> Description:

Clears the Signed flag (S) in SREG (status register).

Operation:

S ← 0

Syntax: Operands: Program Counter:

CLS None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1100 | 1000 |
```
### <a href="" id="N147A6"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | 0   | -   | -   | -   | -   |
```
S: 0 Signed flag cleared

Example:

``` programlisting
add r2,r3 ; Add r3 to r2
cls ; Clear signed flag
```

Words: 1 (2 bytes)

Cycles:
