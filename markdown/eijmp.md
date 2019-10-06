AVR Assembler Instructions
==========================

EIJMP - Extended Indirect Jump
------------------------------

### <a href="" id="N1548A"></a> Description:

Indirect jump to the address pointed to by the Z (16 bits) pointer register in the register file and the EIND register in the I/O space. This instruction allows for indirect jumps to the entire program memory space.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

PC(15:0) ← Z(15:0)

PC(21:16) ← EIND

Syntax: Operands: Program Counter: Stack:

EIJMP None See Operation Not Affected

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0001 | 1001 |

### <a href="" id="N154C1"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
ldi r16, $05 ; Set up EIND and Z pointer
out EIND, r16
ldi r30, $00
ldi r31, $10
eijmp ; Jump to $051000
```

Words: 1 (2 bytes)

Cycles: 2
