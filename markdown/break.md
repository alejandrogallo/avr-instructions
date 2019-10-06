AVR Assembler Instructions
==========================

BREAK - Break
-------------

### <a href="" id="N131CF"></a> Description:

The BREAK instruction is used by the On-Chip Debug system, and is normally not used in the application software. When the BREAK instruction is executed, the AVR CPU is set in the Stopped Mode. This gives the On-Chip Debugger access to internal resources.

If any lock bits are set, or either the JTAGEN or OCDEN fuses are unprogrammed, the CPU will treat the BREAK instruction as a NOP and will not enter the Stopped Mode.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

On-Chip Debug system break.

Syntax: Operands: Program Counter:

BREAK None PC &lt;- PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 1001 | 1000 |
```
### <a href="" id="N13206"></a> Status Register (SREG) and Boolean Formulae:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Words: 1 (2 bytes)

Cycles: 1
