AVR Assembler Instructions
==========================

LDI - Load Immediate
--------------------

### Description:

Loads an 8 bit constant directly to register 16 to 31.

Operation:

(i)Rd ← K

Syntax: Operands: Program Counter:

(i) LDI Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1110 | KKKK | dddd | KKKK |
```
### Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
clrr31 ; Clear Z high byte
ldi r30, $F0 ; Set Z low byte to $F0
lpm ; Load constant from program
; memory pointed to by Z
```

Words: 1 (2 bytes)

Cycles: 1
