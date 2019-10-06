AVR Assembler Instructions
==========================

ROR - Rotate Right through Carry
--------------------------------

### <a href="" id="N18436"></a> Description:

Shifts all bits in Rd one place to the right. The C flag is shifted into bit 7 of Rd. Bit 0 is shifted into the C flag. This operation, combined with <a href="avrassembler.wb_ASR.html" class="xref" title="ASR - Arithmetic Shift Right">ASR</a> , effectively divides multi-byte signed values by two. Combined with <a href="avrassembler.wb_LSR.html" class="xref" title="LSR- Logical Shift Right">LSR</a> it effectively divides multi-byte unsigned values by two. The carry flag can be used to round the result.

Operation:

```
|     |     |            |     |     |
|-----|-----|------------|-----|-----|
| C   | →   | b7——————b0 | →   | C   |
```
Syntax: Operands: Program Counter:

(i) ROR Rd 0 ≤ d ≤ 31 PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 010d | dddd | 0111 |
```
### <a href="" id="N1849C"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | ⇔   | ⇔   | ⇔   | ⇔   |
```
S: N ⊕ V, For signed tests.

V :N ⊕ C (For N and C after the shift)

N: R7

Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

C: Rd0

Set if, before the shift, the LSB of Rd was set; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
lsr r19 ; Divide r19:r18 by two
ror r18 ; r19:r18 is an unsigned two-byte integer
brcc zeroenc1 ; Branch if carry cleared
asr r17 ; Divide r17:r16 by two
ror r16 ; r17:r16 is a signed two-byte integer
brcc zeroenc2 ; Branch if carry cleared
...
zeroenc1:nop ; Branch destination (do nothing)
...
zeroenc2:nop ; Branch destination (do nothing)
```

Words: 1 (2 bytes)

Cycles: 1
