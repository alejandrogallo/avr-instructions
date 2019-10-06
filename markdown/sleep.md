AVR Assembler Instructions
==========================

SLEEP - Sleep mode
------------------

### <a href="" id="N19812"></a> Description:

This instruction sets the circuit in sleep mode defined by the MCU control register.

Operation:

Refer to the device documentation for detailed description of SLEEP usage.

Syntax: Operands: Program Counter:

SLEEP None PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 1000 | 1000 |

### <a href="" id="N19845"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
mov r0,r11 ; Copy r11 to r0
ldi r16,(1<<SE) ; Enable sleep mode
out MCUCR, r16
sleep ; Put MCU in sleep mode
```

Words: 1 (2 bytes)

Cycles: 1
