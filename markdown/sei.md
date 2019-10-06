AVR Assembler Instructions
==========================

SEI - Set Global Interrupt Flag
-------------------------------

### <a href="" id="N192B8"></a> Description:

Sets the Global Interrupt flag (I) in <a href="avrassembler.wb_nomenclature.html#avrassembler.Status_Register" class="xref" title="SREG : Status register">SREG</a> (status register). The instruction following SEI will be executed before any pending interrupts.

Operation:

(i) I ← 1

Syntax: Operands: Program Counter:

(i) SEI None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0111 | 1000 |

### <a href="" id="N192EF"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| 1   | -   | -   | -   | -   | -   | -   | -   |

I: 1

Global Interrupt flag set

Example:

``` programlisting
sei ; set global interrupt enable
sleep ; enter sleep, waiting for interrupt
; note: will enter sleep before any pending interrupt(s)
```

Words: 1 (2 bytes)

Cycles: 1
