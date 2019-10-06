AVR Assembler Instructions
==========================

RJMP - Relative Jump
--------------------

### <a href="" id="N1820A"></a> Description:

Relative jump to an address within PC - 2K +1 and PC + 2K (words). In the assembler, labels are used instead of relative operands. For AVR microcontrollers with program memory not exceeding 4K words (8K bytes) this instruction can address the entire memory from every address location.

Operation:

(i)PC ← PC + k + 1

Syntax: Operands: Program Counter: Stack

(i) RJMP k -2K ≤ k &lt; 2K PC ← PC + k + 1 Unchanged

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1100 | kkkk | kkkk | kkkk |
```
### <a href="" id="N1823D"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
cpi r16,$42 ; Compare r16 to $42
brne error ; Branch if r16 ⇔ $42
rjmpok ; Unconditional branch
error: addr16,r17 ; Add r17 to r16
incr16 ; Increment r16
ok: nop ; Destination for rjmp (do nothing)
```

Words: 1 (2 bytes)

Cycles: 2
