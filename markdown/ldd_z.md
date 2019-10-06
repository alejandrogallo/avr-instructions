AVR Assembler Instructions
==========================

LD (LDD) - Load Indirect From data space to Register using Index Z
------------------------------------------------------------------

### Description:

Loads one byte indirect with or without displacement from the data space to a register. For parts with SRAM, the data space consists of the register file, I/O memory and internal SRAM (and external SRAM if applicable). For parts without SRAM, the data space consists of the register file only. The EEPROM has a separate address space.

The data location is pointed to by the Z (16 bits) pointer register in the register file. Memory access is limited to the current data segment of 64K bytes. To access another data segment in devices with more than 64K bytes data space, the <a href="avrassembler.wb_registers.html#avrassembler.RAMPX__RAMPY__RAMPZ" class="xref" title="RAMPX, RAMPY, RAMPZ">RAMPX, RAMPY, RAMPZ</a> in register in the I/O area has to be changed.

The Z pointer register can either be left unchanged by the operation, or it can be post-incremented or pre-decremented. These features are especially suited for stack pointer usage of the Z pointer register, however because the Z pointer register can be used for indirect subroutine calls, indirect jumps and table lookup, it is often more convenient to use the X or Y pointer as a dedicated stack pointer. Note that only the low byte of the Z pointer is updated in devices with no more than 256 bytes data space. For such devices, the high byte of the pointer is not used by this instruction and can be used for other purposes. The <a href="avrassembler.wb_registers.html#avrassembler.RAMPX__RAMPY__RAMPZ" class="xref" title="RAMPX, RAMPY, RAMPZ">RAMPX, RAMPY, RAMPZ</a> register in the I/O area is updated in parts with more than 64K bytes data space or more than 64K bytes program memory, and the increment/decrement/displacement is added to the entire 24-bit address on such devices.

Not all variants of this instruction is available in all devices. Refer to the device specific instruction set summary.

For using the Z pointer for table lookup in program memory see the <a href="avrassembler.wb_LPM.html" class="xref" title="LPM - Load Program Memory">LPM</a> and <a href="avrassembler.wb_ELPM.html" class="xref" title="ELPM - Extended Load Program Memory">ELPM</a> instructions.

The result of these combinations is undefined:

LD r30, Z+

LD r31, Z+

LD r30, -Z

LD r31, -Z

Using the Z pointer:

Operation: Comment:

(i) Rd ← (Z) Z: Unchanged

(ii) Rd ← (Z) Z ← Z + 1Z: Post increment

(iii) Z ← Z -1 Rd ← (Z) Z: Pre decrement

(iiii)\* Rd ← (Z+q) Z: Unchanged, q: Displacement

Syntax: Operands: Program Counter:

(i) LD Rd, Z 0 ≤ d ≤ 31 PC ← PC + 1

(ii) LD Rd, Z+ 0 ≤ d ≤ 31 PC ← PC + 1

(iii) LD Rd, -Z 0 ≤ d ≤ 31 PC ← PC + 1

(iiii)\* LDD Rd, Z+q 0 ≤ d ≤ 31, 0 ≤ q ≤ 63 PC ← PC + 1

Notes:

\*)The displacement form of this instruction (LDD) is not available on AVR8L based devices.

16-bit Opcode:

| (i)    | 1000 | 000d | dddd | 0000 |
|--------|------|------|------|------|
| (ii)   | 1001 | 000d | dddd | 0001 |
| (iii)  | 1001 | 000d | dddd | 0010 |
| (iiii) | 10q0 | qq0d | dddd | 0qqq |

### Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
clr r31 ; Clear Z high byte
ldi r30,$60 ; Set Z low byte to $60
ld r0,Z+ ; Load r0 with data space loc. $60(Z post inc)
ld r1,Z ; Load r1 with data space loc. $61
ldi r30,$63 ; Set Z low byte to $63
ld r2,Z ; Load r2 with data space loc. $63
ld r3,-Z ; Load r3 with data space loc. $62(Z pre dec)
ldd r4,Z+2 ; Load r4 with data space loc. $64
```

Words:1 (2 bytes)

Cycles:

|        | Cycles | Cycles xmega | Cycles AVR8L |
|--------|--------|--------------|--------------|
| (i)    | 2      | 1/2\*        | 1/2\*\*      |
| (ii)   | 2      | 1/2\*        | 1/2\*\*      |
| (iii)  | 2      | 2/3\*        | 2/3\*\*      |
| (iiii) | 2      | 2/3\*        | N/A          |

(\*) When accessing internal SRAM, one extra cycle is required (\*\*) When accessing FLASH, one extra cycle is required.
