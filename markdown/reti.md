AVR Assembler Instructions
==========================

RETI - Return from Interrupt
----------------------------

### <a href="" id="N1813D"></a> Description:

Returns from interrupt. The return address is loaded from the <a href="avrassembler.wb_registers.html#avrassembler.Stack" class="xref" title="Stack">Stack</a> and the global interrupt flag is set.

Note that the status register is not automatically stored when entering an interrupt routine, and it is not restored when returning from an interrupt routine. This must be handled by the application program. The stack pointer uses a pre-increment scheme during RETI.

Operation:

(i)PC(15:0) ← STACKDevices with 16 bits PC, 128K bytes program memory maximum.

(ii)PC(21:0) ← STACKDevices with 22 bits PC, 8M bytes program memory maximum.

Syntax: Operands: Program Counter: Stack

(i) RETI None See Operation SP ← SP + 2 (2 bytes, 16 bits)

(ii) RETI None See Operation SP ← SP + 3 (3 bytes, 22 bits)

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 0001 | 1000 |

### <a href="" id="N1817A"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| 1   | -   | -   | -   | -   | -   | -   | -   |

I: 1

The I flag is set.

Example:

``` programlisting
...
 extint: push r0 ; Save r0 on the stack
...
pop r0 ; Restore r0
reti ; Return and enable interrupts
```

Words: 1 (2 bytes)

Cycles: 4 devices with 16-bit PC

5 devices with 22-bit PC
