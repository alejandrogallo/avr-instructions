AVR Assembler Instructions
==========================

<a href="" id="avrassembler.wb_LDS_-_Load_direct_from_SRAM"></a> <a href="" id="avrassembler.wb_LDS2"></a> LDS - Load Direct from SRAM
--------------------------------------------------------------------------------------------------------------------------------------

This 1-word form of the LDS instruction is only used on ATtiny10-based devices. Other AVR devices use the <a href="avrassembler.wb_LDS.html" class="xref" title="LDS - Load Direct from data space">LDS</a> .

### Description:

Loads one byte from the SRAM section of the data space to a register.

An 8-bit address in the range 0x40 &lt;= k &lt;= 0xBF must be supplied. The assembler will calculate an 7-bit offset into the SRAM memory from this address, hence this instruction is capable of addressing up to 128 bytes of SRAM. This instruction cannot be used to load I/O addresses, use the <a href="avrassembler.wb_IN.html" class="xref" title="IN - Load an I/O Location to Register">IN</a> instruction for this purpose.

Operation:

(i)Rd ← (k)

Syntax: Operands: Program Counter:

(i)LDS Rd,k 16 ≤ d ≤ 31, 0x40 ≤ k ≤ 0xBF PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1010 | 0kkk | dddd | kkkk |

### Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
lds r2,$40 ; Load r2 with the contents of data space location $FF00
add r2,r1 ; add r1 to r2
sts $40,r2 ; Write back
```

Words:1 (2 bytes)

Cycles:1
