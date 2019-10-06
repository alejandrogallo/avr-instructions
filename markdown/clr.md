AVR Assembler Instructions
==========================

CLR - Clear Register
--------------------

### <a href="" id="N146AC"></a> Description:

Clears a register. This instruction performs an Exclusive OR between a register and itself. This will clear all bits in the register.

Operation:

Rd ← Rd \[+\] Rd

Syntax: Operands: Program Counter:

CLR Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode: (see EOR Rd,Rd)

```
|      |      |      |      |
|------|------|------|------|
| 0010 | 01dd | dddd | dddd |
```
### <a href="" id="N146DF"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | 0   | 0   | 0   | 1   | -   |
```
S: 0 Cleared

V:0 Cleared

N:0 Cleared

Z:1 Set

R (Result) equals Rd after the operation.

Example:

``` programlisting
clr r18 ; clear r18
loop: inc r18 ; increase r18
...
cpi r18, $50 ; Compare r18 to $50
brne loop
```

Words: 1 (2 bytes)

Cycles: 1
