AVR Assembler Instructions
==========================

SEC - Set Carry Flag
--------------------

### <a href="" id="N1912E"></a> Description:

Sets the Carry flag (C) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i)C ← 1

Syntax: Operands: Program Counter:

(i)SEC None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0000 | 1000 |
```
### <a href="" id="N19165"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | 1   |
```
C: 1

Carry flag set

Example:

``` programlisting
sec ; Set carry flag
adc r0,r1 ; r0=r0+r1+1
```

Words: 1 (2 bytes)

Cycles: 1
