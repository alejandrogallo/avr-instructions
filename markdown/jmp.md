AVR Assembler Instructions
==========================

JMP - Jump
----------

### Description:

Jump to an address within the entire 4M (words) program memory. See also <a href="avrassembler.wb_RJMP.html" class="xref" title="RJMP- Relative Jump">RJMP</a> .

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i)PC ← k

Syntax: Operands: Program Counter: Stack:

(i)JMP k 0 ≤ k &lt; 4M PC ← k Unchanged

32-bit Opcode:

| 1001 | 010k | kkkk | 110k |
|------|------|------|------|
| kkkk | kkkk | kkkk | kkkk |

### Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
mov r1,r0 ; Copy r0 to r1
jmp farplc ; Unconditional jump
...
farplc:nop ; Jump destination (do nothing)
```

Words: 2 (4 bytes)

Cycles: 3
