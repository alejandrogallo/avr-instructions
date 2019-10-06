AVR Assembler Instructions
==========================

LDS - Load Direct from data space
---------------------------------

### Description:

Loads one byte from the data space to a register. For parts with SRAM, the data space consists of the register file, I/O memory and internal SRAM (and external SRAM if applicable). For parts without SRAM, the data space consists of the register file only. The EEPROM has a separate address space.

A 16-bit address must be supplied. Memory access is limited to the current data segment of 64K bytes. The LDS instruction uses the <a href="avrassembler.wb_registers.html#avrassembler.RAMPD" class="xref" title="RAMPD">RAMPD</a> register to access memory above 64K bytes. To access another data segment in devices with more than 64K bytes data space, the RAMPD in register in the I/O area has to be changed.

This instruction is not available in all devices. Refer to the device specific instruction set summary. In particular, notice that ATtiny10-based devices use the <a href="avrassembler.wb_LDS_-_Load_direct_from_SRAM.html" class="xref" title="LDS - Load Direct from SRAM">LDS</a> instead of this instruction.

Operation:

(i)Rd ← (k)

Syntax: Operands: Program Counter:

(i)LDS Rd,k 0 ≤ d ≤ 31, 0 ≤ k ≤ 65535 PC ← PC + 2

32-bit Opcode:

```
| 1001 | 000d | dddd | 0000 |
|------|------|------|------|
| kkkk | kkkk | kkkk | kkkk |
```
### Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
lds r2,$FF00 ; Load r2 with the contents of data space location $FF00
add r2,r1 ; add r1 to r2
sts $FF00,r2 ; Write back
```

Words: 2 (4 bytes)

```
|               | Cycles | Cycles xmega |
|---------------|--------|--------------|
| I/O           | 2      | 2            |
| Internal SRAM | 2      | 3            |
