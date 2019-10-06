AVR Assembler Instructions
==========================

SWAP - Swap Nibbles
-------------------

### <a href="" id="N1A3F5"></a> Description:

Swaps high and low nibbles in a register.

Operation:

(i)R(7:4) ← Rd(3:0), R(3:0) ← Rd(7:4)

Syntax: Operands: Program Counter:

(i)SWAP Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0010 |

### <a href="" id="N1A428"></a> Status Register and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

R (Result) equals Rd after the operation.

Example:

``` programlisting
inc r1 ; Increment r1
swap r1 ; Swap high and low nibble of r1
inc r1 ; Increment high nibble of r1
swap r1 ; Swap back
```

Words: 1 (2 bytes)

Cycles: 1
