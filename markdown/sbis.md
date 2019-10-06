AVR Assembler Instructions
==========================

SBIS - Skip if Bit in I/O Register is Set
-----------------------------------------

### <a href="" id="N18B6B"></a> Description:

This instruction tests a single bit in an I/O register and skips the next instruction if the bit is set. This instruction operates on the lower 32 I/O registers - addresses 0-31.

Operation:

(i)If I/O(A,b) = 1 then PC ← PC + 2 (or 3) else PC ← PC + 1

Syntax: Operands: Program Counter:

(i)SBIS A,b 0 ≤ A ≤ 31, 0 ≤ b ≤ 7 PC ← PC + 1, Condition false - no skip

PC ← PC + 2, Skip a one word instruction

PC ← PC + 3, Skip a two word instruction

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 1011 | AAAA | Abbb |

### <a href="" id="N18BA2"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
 waitset: sbis $10,0 ; Skip next inst. if bit 0 in Port D set
rjmp waitset ; Bit not set
nop ; Continue (do nothing)
```

Words:1 (2 bytes)

|                                                      | Cycles | Cycles xmega | Cycles AVR8L |
|------------------------------------------------------|--------|--------------|--------------|
| Condition is false                                   | 1      | 2            | 1            |
| Condition is true and instruction skipped is 1 word  | 2      | 3            | 2            |
| Condition is true and instruction skipped is 2 words | 3      | 4            | N/A          |
