AVR Assembler Instructions
==========================

SBRS - Skip if Bit in Register is Set
-------------------------------------

### <a href="" id="N19069"></a> Description:

This instruction tests a single bit in a register and skips the next instruction if the bit is set.

Operation:

(i)If Rr(b) = 1 then PC ← PC + 2 (or 3) else PC ← PC + 1

Syntax: Operands: Program Counter:

(i)SBRS Rr,b 0 ≤ r ≤ 31, 0 ≤ b ≤ 7 PC ← PC + 1, Condition false - no skip

PC ← PC + 2, Skip a one word instruction

PC ← PC + 3, Skip a two word instruction

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1111 | 111r | rrrr | 0bbb |

### <a href="" id="N190A0"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
sub r0,r1 ; Subtract r1 from r0
sbrs r0,7 ; Skip if bit 7 in r0 set
neg r0 ; Only executed if bit 7 in r0 not set
nop ; Continue (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1 if condition is false (no skip)

2 if condition is true (skip is executed) and the instruction skipped is 1 word

3 if condition is true (skip is executed) and the instruction skipped is 2 words
