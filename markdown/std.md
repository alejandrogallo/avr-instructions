AVR Assembler Instructions
==========================

ST ( STD ) - Store Indirect From Register to data space using Index Y
---------------------------------------------------------------------

### <a href="" id="N19B16"></a> Description:

Stores one byte indirect with or without displacement from a register to data space. For parts with SRAM, the data space consists of the register file, I/O memory and internal SRAM (and external SRAM if applicable). For parts without SRAM, the data space consists of the register file only. The EEPROM has a separate address space.

The data location is pointed to by the Y (16 bits) pointer register in the register file. Memory access is limited to the current data segment of 64K bytes. To access another data segment in devices with more than 64K bytes data space, the <a href="avrassembler.wb_registers.html#avrassembler.RAMPX__RAMPY__RAMPZ" class="xref" title="RAMPX, RAMPY, RAMPZ">RAMPX, RAMPY, RAMPZ</a> in register in the I/O area has to be changed.

The Y pointer register can either be left unchanged by the operation, or it can be post-incremented or pre-decremented. These features are especially suited for accessing arrays, tables, and stack pointer usage of the Y pointer register. Note that only the low byte of the Y pointer is updated in devices with no more than 256 bytes data space. For such devices, the high byte of the pointer is not used by this instruction and can be used for other purposes. The RAMPY register in the I/O area is updated in parts with more than 64K bytes data space or more than 64K bytes program memory, and the increment/ decrement/displacement is added to the entire 24-bit address on such devices.

Not all variants of this instruction is available in all devices. Refer to the device specific instruction set summary.

The result of these combinations is undefined:

ST Y+, r28

ST Y+, r29

ST -Y, r28

ST -Y, r29

Using the Y pointer:

Operation: Comment:

(i) (Y) ← Rr Y: Unchanged

(ii) (Y) ← Rr Y ← Y+1 Y: Post incremented

(iii) Y ← Y - 1 (Y) ← Rr Y: Pre decremented

(iiii)\* (Y+q) ← Rr Y: Unchanged, q: Displacement

Syntax: Operands: Program Counter:

(i) ST Y, Rr 0 ≤ r ≤ 31 PC ← PC + 1

(ii) ST Y+, Rr 0 ≤ r ≤ 31 PC ← PC + 1

(iii) ST -Y, Rr 0 ≤ r ≤ 31 PC ← PC + 1

(iiii)\* STD Y+q, Rr 0 ≤ r ≤ 31, 0 ≤ q ≤ 63 PC ← PC + 1

Notes:

\*)The displacement form of this instruction (LDD) is not available on AVR8L based devices.

16-bit Opcode:

```
| (i)    | 1000 | 001r | rrrr | 1000 |
|--------|------|------|------|------|
| (ii)   | 1001 | 001r | rrrr | 1001 |
| (iii)  | 1001 | 001r | rrrr | 1010 |
| (iiii) | 10q0 | qq1r | rrrr | 1qqq |
```
### <a href="" id="N19BC6"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
clr r29 ; Clear Y high byte
ldi r28,$60 ; Set Y low byte to $60
st Y+,r0 ; Store r0 in data space loc. $60(Y post inc)
st Y,r1 ; Store r1 in data space loc. $61
ldi r28,$63 ; Set Y low byte to $63
st Y,r2 ; Store r2 in data space loc. $63
st -Y,r3 ; Store r3 in data space loc. $62(Y pre dec)
std Y+2,r4 ; Store r4 in data space loc. $64
```

Words:1 (2 bytes)

Cycles:

```
|        | Cycles | Cycles xmega | Cycles AVR8L |
|--------|--------|--------------|--------------|
| (i)    | 2      | 1            | 1            |
| (ii)   | 2      | 1            | 1            |
| (iii)  | 2      | 2            | 2            |
| (iiii) | 2      | 2            | N/A          |
