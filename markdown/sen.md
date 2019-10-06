AVR Assembler Instructions
==========================

SEN - Set Negative Flag
-----------------------

### <a href="" id="N1937D"></a> Description:

Sets the Negative flag (N) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i) N ← 1

Syntax: Operands: Program Counter:

(i) SEN None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0010 | 1000 |

### <a href="" id="N193B4"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | 1   | -   | -   |

N: 1

Negative flag set

Example:

``` programlisting
add r2,r19 ; Add r19 to r2
sen ; Set negative flag
```

Words: 1 (2 bytes)

Cycles: 1
