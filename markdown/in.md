AVR Assembler Instructions
==========================

IN - Load an I/O Location to Register
-------------------------------------

### <a href="" id="N15F89"></a> Description:

Loads data from the I/O Space (Ports, Timers, Configuration registers etc.) into register Rd in the register file.

Operation:

(i)Rd ← I/O(A)

Syntax: Operands: Program Counter:

IN Rd,A 0 ≤ d ≤ 31, 0 ≤ A ≤ 63 PC ← PC + 1

16-bit Opcode:

|      |      |      |      |
|------|------|------|------|
| 1011 | 0AAd | dddd | AAAA |

### <a href="" id="N15FBC"></a> Status Register (SREG) and Boolean Formula:

| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |

Example:

``` programlisting
in r25,$16 ; Read Port B
cpi r25,4 ; Compare read value to constant
breqexit ; Branch if r25=4
...
exit: nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
