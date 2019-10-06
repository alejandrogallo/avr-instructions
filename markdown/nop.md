AVR Assembler Instructions
==========================

NOP - No Operation
------------------

### <a href="" id="N179C3"></a> Description:

This instruction performs a single cycle No Operation.

Operation:

(i)No

Syntax: Operands: Program Counter:

(i) NOP None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 0000 | 0000 | 0000 |
```
### <a href="" id="N179F6"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
clr r16 ; Clear r16
ser r17 ; Set r17
out$18,r16 ; Write zeros to Port B
nop ; Wait (do nothing)
out$18,r17 ; Write ones to Port B
```

Words: 1 (2 bytes)

Cycles: 1
