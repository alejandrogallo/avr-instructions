AVR Assembler Instructions
==========================

LAC - Load and Clear
--------------------

### Description:

Load one byte indirect from data space to register and stores an clear the bits in data space specified by the register. The instruction can only be used towards internal SRAM.

The data location is pointed to by the Z (16 bits) Pointer Register in the Register File. Memory access is limited to the current data segment of 64K bytes. To access another data segment in devices with more than 64K bytes data space, the RAMPZ in register in the I/O area has to be changed.

The Z-pointer Register is left unchanged by the operation. This instruction is especially suited for clearing status bits stored in SRAM.

Operation:

(Z) ← ($FF - Rd) • (Z)

Syntax: Operands: Program Counter:

LAC Z, Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 000r | rrrr | 0110 |
```
### Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Words:1 (2 bytes)

Cycles: 2
