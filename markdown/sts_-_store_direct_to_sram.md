AVR Assembler Instructions
==========================

<a href="" id="avrassembler.wb_STS_-_Store_Direct_to_SRAM"></a> <a href="" id="avrassembler.wb_STS_-_Store_Direct_to_SRAM1"></a> STS - Store Direct to SRAM
-----------------------------------------------------------------------------------------------------------------------------------------------------------

This 1-word form of the STS instruction is only used on ATtiny10-based devices. Other AVR devices use the <a href="avrassembler.wb_STS.html" class="xref" title="STS - Store Direct to data space">STS</a> .

Stores one byte from a register to the SRAM section of the data space.

An 8-bit address in the range 0x40 &lt;= k &lt;= 0xBF must be supplied. The assembler will calculate an 7-bit offset into the SRAM memory from this address, hence this instruction is capable of addressing up to 128 bytes of SRAM. This instruction cannot be used to store I/O addresses, use the <a href="avrassembler.wb_OUT.html" class="xref" title="OUT - Store Register to I/O Location">OUT</a> instruction for this purpose.

Operation:

(i)(k) &lt;- Rr

Syntax: Operands: Program Counter:

(i)STS k, Rr 16 ≤ r ≤ 31, 0x40 ≤ k ≤ 0xBF PC &lt;- PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1010 | 1kkk | rrrr | kkkk |
```
### <a href="" id="N19F91"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
lds r2,$40 ; Load r2 with the contents of data space location $FF00
add r2,r1 ; add r1 to r2
sts $40,r2 ; Write back
```

Words:1 (2 bytes)

Cycles:1
