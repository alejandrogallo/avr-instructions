AVR Assembler Instructions
==========================

CBI - Clear Bit in I/O Register
-------------------------------

### <a href="" id="N141DA"></a> Description:

Clears a specified bit in an I/O register. This instruction operates on the lower 32 I/O registers - addresses 0-31.

Operation:

I/O(A,b) ← 0

Syntax: Operands: Program Counter:

CBI A, b 0 ≤ A ≤ 31, 0 ≤ b ≤ 7 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 1000 | AAAA | Abbb |

### <a href="" id="N1420D"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
cbi $12, 7 ; Clear bit 7 in Port D
```

Words: 1 (2 bytes)

Cycles: 2 Cycles xmega/AVR8L: 1
