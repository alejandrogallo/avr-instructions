AVR Assembler Instructions
==========================

RCALL - Relative Call to Subroutine
-----------------------------------

### <a href="" id="N17F61"></a> Description:

Relative call to an address within PC - 2K + 1 and PC + 2K (words). The return address (the instruction after the RCALL) is stored onto the stack. (See also <a href="avrassembler.wb_CALL.html" class="xref" title="CALL - Long Call to a Subroutine">CALL</a> ). In the assembler, labels are used instead of relative operands. For AVR microcontrollers with program memory not exceeding 4K words (8K bytes) this instruction can address the entire memory from every address location. The stack pointer uses a post-decrement scheme during RCALL.

Operation:

(i)PC ← PC + k + 1 Devices with 16 bits PC, 128K bytes program memory maximum.

(ii)PC ← PC + k + 1 Devices with 22 bits PC, 8M bytes program memory maximum.

Syntax: Operands: Program Counter: Stack:

(i) RCALL k -2K ≤ k &lt; 2K PC ← PC + k + 1 STACK ← PC + 1

SP ← SP - 2 (2 bytes, 16 bits)

(ii)RCALL k -2K ≤ k &lt; 2K PC ← PC + k + 1 STACK ← PC + 1

SP ← SP - 3 (3 bytes, 22 bits)

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1101 | kkkk | kkkk | kkkk |
```
### <a href="" id="N17FA0"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
rcall routine ; Call subroutine
...
 routine: push r14 ; Save r14 on the stack
...
pop r14 ; Restore r14
ret ; Return from subroutine
```

Words:1 (2 bytes)

Cycles:

```
|                        | Cycles | Cycles xmega | Cycles AVR8L |
|------------------------|--------|--------------|--------------|
| Devices with 16-bit PC | 3      | 2            | 4            |
| Devices with 22-bit PC | 4      | 3            | N/A          |
