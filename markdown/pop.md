AVR Assembler Instructions
==========================

POP - Pop Register from Stack
-----------------------------

### <a href="" id="N17DB5"></a> Description:

This instruction loads register Rd with a byte from the <a href="avrassembler.wb_registers.html#avrassembler.Stack" class="xref" title="Stack">Stack</a> . The stack pointer is pre-incremented by 1 before the POP.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)Rd ← STACK

Syntax: Operands: Program Counter: Stack:

(i) POP Rd 0 ≤ d ≤ 31 PC ← PC + 1 SP ← SP + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 000d | dddd | 1111 |
```
### <a href="" id="N17DEE"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
 callroutine ; Call subroutine
 ...
 routine: pushr14 ; Save r14 on the stack
push r13 ; Save r13 on the stack
...
pop r13 ; Restore r13
pop r14 ; Restore r14
ret ; Return from subroutine
```

Words: 1 (2 bytes)

Cycles: 2
