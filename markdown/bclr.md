AVR Assembler Instructions
==========================

BCLR - Bit Clear in SREG
------------------------

### <a href="" id="N12D3A"></a> Description:

Clears a single flag in SREG.

Operation:

(i)SREG(s) ← 0

Syntax: Operands: Program Counter:

(i)BCLR s 0 ≤ s ≤ 7 PC &lt;- PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 0100 | 1sss | 1000 |

### <a href="" id="N12D6D"></a> Status Register (SREG) and Boolean Formulae:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |

I:0 if s = 7; Unchanged otherwise.

T:0 if s = 6; Unchanged otherwise.

H:0 if s = 5; Unchanged otherwise.

S:0 if s = 4; Unchanged otherwise.

V:0 if s = 3; Unchanged otherwise.

N:0 if s = 2; Unchanged otherwise.

Z:0 if s = 1; Unchanged otherwise.

C:0 if s = 0; Unchanged otherwise.

Example:

``` programlisting
    bclr 0; Clear carry flag
    bclr 7; Disable interrupts
    
```

Words: 1 (2 bytes)

Cycles: 1
