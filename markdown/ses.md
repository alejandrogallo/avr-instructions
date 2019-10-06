AVR Assembler Instructions
==========================

SES - Set Signed Flag
---------------------

### <a href="" id="N194FF"></a> Description:

Sets the Signed flag (S) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i) S ← 1

Syntax: Operands: Program Counter:

(i) SES None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0100 | 1000 |
```
### <a href="" id="N19536"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | 1   | -   | -   | -   | -   |
```
S: 1

Signed flag set

Example:

``` programlisting
add r2,r19 ; Add r19 to r2
ses ; Set negative flag
```

Words: 1 (2 bytes)

Cycles: 1
