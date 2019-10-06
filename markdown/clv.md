AVR Assembler Instructions
==========================

CLV - Clear Overflow Flag
-------------------------

### <a href="" id="N148F1"></a> Description:

Clears the Overflow flag (V) in SREG (status register).

Operation:

V ← 0

Syntax: Operands: Program Counter:

CLV None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1011 | 1000 |
```
### <a href="" id="N14924"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | 0   | -   | -   | -   |
```
V: 0 Overflow flag cleared

Example:

``` programlisting
add r2,r3 ; Add r3 to r2
clv ; Clear overflow flag
```

Words: 1 (2 bytes)

Cycles: 1
