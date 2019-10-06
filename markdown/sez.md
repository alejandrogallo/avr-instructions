AVR Assembler Instructions
==========================

SEZ - Set Zero Flag
-------------------

### <a href="" id="N1974D"></a> Description:

Sets the Zero flag (Z) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i) Z ← 1

Syntax: Operands: Program Counter:

(i) SEZ None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0001 | 1000 |

### <a href="" id="N19784"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | 1   | -   |

Z: 1

Zero flag set

Example:

``` programlisting
add r2,r19 ; Add r19 to r2
sez ; Set zero flag
```

Words: 1 (2 bytes)

Cycles: 1
