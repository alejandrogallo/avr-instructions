AVR Assembler Instructions
==========================

CALL - Long Call to a Subroutine
--------------------------------

### <a href="" id="N140BF"></a> Description:

Calls to a subroutine within the entire program memory. The return address (to the instruction after the CALL) will be stored onto the stack. (See also <a href="avrassembler.wb_RCALL.html" class="xref" title="RCALL - Relative Call to Subroutine">RCALL</a> ). The stack pointer uses a post-decrement scheme during CALL.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

PC ←k Devices with 16 bits PC, 128K bytes program memory maximum.

PC ←k Devices with 22 bits PC, 8M bytes program memory maximum.

Syntax: Operands: Program Counter Stack:

CALL k 0 ≤ k &lt; 64K PC ← k STACK ← PC+2

SP ← SP-2, (2 bytes, 16 bits)

CALL k 0 ≤ k &lt; 4M PC ← k STACK ← PC+2

SP ← SP-3 (3 bytes, 22 bits)

32-bit Opcode:

| 1001 | 010k | kkkk | 111k |
|------|------|------|------|
| kkkk | kkkk | kkkk | kkkk |

### <a href="" id="N14116"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
mov r16,r0 ; Copy r0 to r16
call check ; Call subroutine
nop ; Continue (do nothing)
...
check: cpi r16, $42 ; Check if r16 has a special value
breq error ; Branch if equal
ret ; Return from subroutine
...
error: rjmp error ; Infinite loop
```

Words:2 (4 bytes)

Cycles:

|                        | Cycles | Cycles xmega |
|------------------------|--------|--------------|
| Devices with 16-bit PC | 4      | 3            |
| Devices with 22-bit PC | 5      | 4            |
