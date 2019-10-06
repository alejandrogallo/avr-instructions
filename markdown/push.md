AVR Assembler Instructions
==========================

PUSH - Push Register on Stack
-----------------------------

### <a href="" id="N17E78"></a> Description:

This instruction stores the contents of register Rr on the STACK. The stack pointer is post-decremented by 1 after the PUSH.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i) STACK ← Rr

Syntax: Operands: Program Counter: Stack:

(i) PUSH Rr 0 ≤ r ≤ 31 PC ← PC + 1 SP ← SP - 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 001d | dddd | 1111 |

### <a href="" id="N17EAD"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
 call routine ; Call subroutine
...
routine: push r14 ; Save r14 on the stack
push r13 ; Save r13 on the stack
...
pop r13 ; Restore r13
pop r14 ; Restore r14
ret ; Return from subroutine
```

Words:1 (2 bytes)

Cycles:

|      | Cycles | Cycles xmega |
|------|--------|--------------|
| PUSH | 2      | 1            |
