AVR Assembler Instructions
==========================

SET - Set T Flag
----------------

### <a href="" id="N195C4"></a> Description:

Sets the T flag in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i) T ← 1

Syntax: Operands: Program Counter:

(i) SET None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0110 | 1000 |

### <a href="" id="N195FB"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | 1   | -   | -   | -   | -   | -   | -   |

T: 1

T flag set

Example:

``` programlisting
set ; Set T flag
```

Words: 1 (2 bytes)

Cycles: 1
