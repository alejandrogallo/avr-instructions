AVR Assembler Instructions
==========================

XCH - Exchange
--------------

### <a href="" id="N1A6AD"></a> Description:

Exchanges one byte indirect between register and data space.

The data location is pointed to by the Z (16 bits) Pointer Register in the Register File. Memory access is limited to the current data segment of 64K bytes. To access another data segment in devices with more than 64K bytes data space, the RAMPZ in register in the I/O area has to be changed.

The Z-pointer Register is left unchanged by the operation. This instruction is especially suited for writing/reading status bits stored in SRAM.

Operation:

(Z) ← Rd,(Z) ← Rd

Syntax: Operands: Program Counter:

XCH Z, Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 000r | rrrr | 0100 |
```
### <a href="" id="N1A6E4"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Words:1 (2 bytes)

Cycles: 2
