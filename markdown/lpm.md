AVR Assembler Instructions
==========================

LPM - Load Program Memory
-------------------------

### Description:

Loads one byte pointed to by the Z register into the destination register Rd. This instruction features a 100% space effective constant initialization or constant data fetch. The program memory is organized in 16 bit words while the Z pointer is a byte address. Thus, the least significant bit of the Z pointer selects either low byte (ZLSB = 0) or high byte (ZLSB = 1). This instruction can address the first 64K bytes (32K words) of program memory. The Z pointer register can either be left unchanged by the operation, or it can be incremented. The increment does not apply to the <a href="avrassembler.wb_registers.html#avrassembler.RAMPX__RAMPY__RAMPZ" class="xref" title="RAMPX, RAMPY, RAMPZ">RAMPX, RAMPY, RAMPZ</a> register.

Devices with Self-Programming capability can use the LPM instruction to read the fuse and lock bit values. Refer to the device documentation for a detailed description.

Not all variants of the LPM instruction are available in all devices. Refer to the device specific instruction set summary. The LPM instruction is not implemented at all in the AT90S1200 device.

The result of these combinations is undefined:

LPM r30, Z+

LPM r31, Z+

Operation: Comment:

(i) R0 ← (Z) Z: Unchanged, R0 implied destination register

(ii) Rd ← (Z) Z: Unchanged

(iii) Rd ← (Z) Z ← Z + 1Z: Post incremented

Syntax: Operands: Program Counter:

(i) LPM None, R0 implied PC ← PC + 1

(ii)LPM Rd, Z 0 ≤ d ≤ 31 PC ← PC + 1

(iii)LPM Rd, Z+ 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
| (i)   | 1001 | 0101 | 1100 | 1000 |
|-------|------|------|------|------|
| (ii)  | 1001 | 000d | dddd | 0100 |
| (iii) | 1001 | 000d | dddd | 0101 |
```
Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
ldi ZH, high(Table_1<<1) ; Initialize Z pointer
ldi ZL, low(Table_1<<1)
lpm r16, Z ; Load constant from program
; memory pointed to by Z (r31:r30)
...
Table_1:
.dw 0x5876; 0x76 is addresses when ZLSB = 0
; 0x58 is addresses when ZLSB = 1
...
```

Words: 1 (2 bytes)

Cycles: 3
