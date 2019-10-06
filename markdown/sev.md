AVR Assembler Instructions
==========================

SEV - Overflow Flag
-------------------

### <a href="" id="N19688"></a> Description:

Sets the Overflow flag (V) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i) V ← 1

Syntax: Operands: Program Counter:

(i)SEV None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0011 | 1000 |

### <a href="" id="N196BF"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | 1   | -   | -   | -   |

V: 1

Overflow flag set

Example:

``` programlisting
add r2,r19; Add r19 to r2
sev ; Set overflow flag
```

Words: 1 (2 bytes)

Cycles: 1
