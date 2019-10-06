AVR Assembler Instructions
==========================

EICALL - Extended Indirect Call to Subroutine
---------------------------------------------

### <a href="" id="N15399"></a> Description:

Indirect call of a subroutine pointed to by the Z (16 bits) pointer register in the register file and the EIND register in the I/O space. This instruction allows for indirect calls to the entire program memory space. The stack pointer uses a post-decrement scheme during EICALL.

This instruction is not implemented for devices with 2 bytes PC, see <a href="avrassembler.wb_ICALL.html" class="xref" title="ICALL - Indirect Call to Subroutine">ICALL</a> . Refer to the device specific instruction set summary.

Operation:

PC(15:0) ← Z(15:0)

PC(21:16) ← EIND

Syntax: Operands: Program Counter: Stack:

EICALL None See Operation STACK ← PC + 1

SP -&lt; SP - 3 (3 bytes, 22 bits)

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 0001 | 1001 |

### <a href="" id="N153D6"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
ldi r16,$05 ; Set up EIND and Z pointer
out EIND,r16
ldi 30, $00
ldi r31, $10
eicall ; Call to $051000
```

Words: 1 (2 bytes)

Cycles:

|                                            | Cycles | Cycles xmega |
|--------------------------------------------|--------|--------------|
| Only implemented in devices with 22-bit PC | 4      | 3            |
