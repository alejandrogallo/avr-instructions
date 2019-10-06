AVR Assembler Instructions
==========================

SEH - Set Half Carry Flag
-------------------------

### <a href="" id="N191F3"></a> Description:

Sets the Half Carry (H) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register).

Operation:

(i)H ← 1

Syntax: Operands: Program Counter:

(i) SEH None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0101 | 1000 |

### <a href="" id="N1922A"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | 1   | -   | -   | -   | -   | -   |

H: 1

Half Carry flag set

Example:

``` programlisting
seh ; Set Half Carry flag
```

Words: 1 (2 bytes)

Cycles: 1
