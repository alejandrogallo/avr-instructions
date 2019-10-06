AVR Assembler Instructions
==========================

IJMP - Indirect Jump
--------------------

### <a href="" id="N15EC6"></a> Description:

Indirect jump to the address pointed to by the Z (16 bits) pointer register in the register file. The Z pointer register is 16 bits wide and allows jump within the lowest 64K words (128K bytes) section of program memory.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i) PC ← Z(15:0) Devices with 16 bits PC, 128K bytes program memory maximum.

(ii) PC(15:0) ← Z(15:0)Devices with 22 bits PC, 8M bytes program memory maximum.

PC(21:16) ← 0

Syntax: Operands: Program Counter: Stack:

(i), (ii) IJMP None See Operation Not Affected

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0000 | 1001 |
```
### <a href="" id="N15EFF"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
mov r30,r0 ; Set offset to jump table
ijmp ; Jump to routine pointed to by r31:r30
```

Words: 1 (2 bytes)

Cycles: 2
