AVR Assembler Instructions
==========================

OUT - Store Register to I/O Location
------------------------------------

### <a href="" id="N17CF8"></a> Description:

Stores data from register Rr in the register file to I/O Space (Ports, Timers, Configuration registers etc.).

Operation:

(i)I/O(A) ← Rr

Syntax: Operands: Program Counter:

(i) OUT A,Rr 0 ≤ r ≤ 31, 0 ≤ A ≤ 63 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1011 | 1AAr | rrrr | AAAA |
```
### <a href="" id="N17D2B"></a> Status Register (SREG) and Boolean Formula:

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
nop ; Wait (do nothing)
out $18,r17 ; Write ones to Port B
```

Words: 1 (2 bytes)

Cycles: 1
