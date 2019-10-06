AVR Assembler Instructions
==========================

CLI - Clear Global Interrupt Flag
---------------------------------

### <a href="" id="N1452C"></a> Description:

Clears the Global Interrupt flag (I) in SREG (status register). The interrupts will be immediately disabled. No interrupt will be executed after the CLI instruction, even if it occurs simultaneously with the CLI instruction.

Operation:

I ← 0

Syntax: Operands: Program Counter:

CLI None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1111 | 1000 |

### <a href="" id="N1455F"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| 0   | -   | -   | -   | -   | -   | -   | -   |

I: 0

Global Interrupt flag cleared

Example:

``` programlisting
in temp, SREG ; Store SREG value (temp must be defined by user)
cli ; Disable interrupts during timed sequence
sbi EECR, EEMWE ; Start EEPROM write
sbi EECR, EEWE
out SREG, temp ; Restore SREG value (I-flag)
```

Words: 1 (2 bytes)

Cycles: 1
