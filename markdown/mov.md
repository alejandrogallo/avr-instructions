AVR Assembler Instructions
==========================

MOV - Copy Register
-------------------

### <a href="" id="N1707E"></a> Description:

This instruction makes a copy of one register into another. The source register Rr is left unchanged, while the destination register Rd is loaded with a copy of Rr.

Operation:

(i) Rd ← Rr

Syntax: Operands: Program Counter:

(i) MOV Rd,Rr 0 ≤ d ≤ 31, 0 ≤ r ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0010 | 11rd | dddd | rrrr |
```
### <a href="" id="N170B1"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
mov r16,r0 ; Copy r0 to r16
call check ; Call subroutine
...
check: cpi r16,$11 ; Compare r16 to $11
...
ret ; Return from subroutine
```

Words: 1 (2 bytes)

Cycles: 1
