AVR Assembler Instructions
==========================

CLZ - Clear Zero Flag
---------------------

### <a href="" id="N149B0"></a> Description:

Clears the Zero flag (Z) in SREG (status register).

Operation:

Z ← 0

Syntax: Operands: Program Counter:

CLZ None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1001 | 1000 |
```
### <a href="" id="N149E3"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | 0   | -   |
```
Z: 0 Zero flag cleared

Example:

``` programlisting
add r2,r3 ; Add r3 to r2
clz; Clear zero
```

Words: 1 (2 bytes)

Cycles: 1
