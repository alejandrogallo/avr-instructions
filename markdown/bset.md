AVR Assembler Instructions
==========================

BSET - Bit Set in SREG
----------------------

### <a href="" id="N13F33"></a> Description:

Sets a single flag or bit in SREG.

Operation:

SREG(s) ← 1

Syntax: Operands: Program Counter:

BSET s 0 ≤ s ≤ 7 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 0sss | 1000 |

### <a href="" id="N13F66"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

I: 1 if s = 7; Unchanged otherwise.

T: 1 if s = 6; Unchanged otherwise.

H: 1 if s = 5; Unchanged otherwise.

S: 1 if s = 4; Unchanged otherwise.

V: 1 if s = 3; Unchanged otherwise.

N: 1 if s = 2; Unchanged otherwise.

Z: 1 if s = 1; Unchanged otherwise.

C: 1 if s = 0; Unchanged otherwie.

Example:

``` programlisting
bset 6 ; Set T flag
bset 7 ; Enable interrupt
```

Words: 1 (2 bytes)

Cycles: 1
