AVR Assembler Instructions
==========================

RET - Return from Subroutine
----------------------------

### <a href="" id="N18076"></a> Description:

Returns from subroutine. The return address is loaded from the <a href="avrassembler.wb_registers.html#avrassembler.Stack" class="xref" title="Stack">Stack</a> . The stack pointer uses a pre-increment scheme during RET.

Operation:

(i)PC(15:0) ← STACK Devices with 16 bits PC, 128K bytes program memory maximum.

(ii)PC(21:0) ← STACK Devices with 22 bits PC, 8M bytes program memory maximum.

Syntax: Operands: Program Counter: Stack:

(i) RET None See Operation SP←SP + 2, (2bytes,16 bits)

(ii) RET None See Operation SP←SP + 3, (3bytes,22 bits)

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 0000 | 1000 |
```
### <a href="" id="N180B1"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
 callroutine ; Call subroutine
...
 routine: push r14 ; Save r14 on the stack
...
pop r14 ; Restore r14
ret ; Return from subroutine
```

Words: 1 (2 bytes)

Cycles: 4 devices with 16-bit PC

5 devices with 22-bit PC
