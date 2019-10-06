AVR Assembler Instructions
==========================

SBI - Set Bit in I/O Register
-----------------------------

### <a href="" id="N1898D"></a> Description:

Sets a specified bit in an I/O register. This instruction operates on the lower 32 I/O registers - addresses 0-31.

Operation:

(i)I/O(A,b) ← 1

Syntax: Operands: Program Counter:

(i)SBI A,b 0 ≤ A ≤ 31, 0 ≤ b ≤ 7 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 1010 | AAAA | Abbb |
```
### <a href="" id="N189C0"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
out $1E,r0 ; Write EEPROM address
sbi $1C,0 ; Set read bit in EECR
in r1,$1D ; Read EEPROM data
```

Words: 1 (2 bytes)

Cycles: 2 Cycles xmega/AVR8L: 1
