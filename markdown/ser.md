AVR Assembler Instructions
==========================

SER - Set all bits in Register
------------------------------

### <a href="" id="N19442"></a> Description:

Loads $FF directly to register Rd.

Operation:

(i) Rd ← $FF

Syntax: Operands: Program Counter:

(i) SER Rd 16 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1110 | 1111 | dddd | 1111 |
```
### <a href="" id="N19475"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
clr r16 ; Clear r16
ser r17 ; Set r17
out $18,r16 ; Write zeros to Port B
nop ; Delay (do nothing)
out $18,r17 ; Write ones to Port B
```

Words: 1 (2 bytes)

Cycles: 1
