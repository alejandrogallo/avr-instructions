AVR Assembler Instructions
==========================

CBR - Clear Bits in Register
----------------------------

### <a href="" id="N14297"></a> Description:

Clears the specified bits in register Rd. Performs the logical AND between the contents of register Rd and the complement of the constant mask K. The result will be placed in register Rd.

Operation:

Rd &lt;- Rd • ($FF - K)

Syntax: Operands: Program Counter:

CBR Rd,K 16 ≤ d ≤ 31, 0 ≤ K ≤ 255 PC &lt;- PC + 1

16-bit Opcode: (see <a href="avrassembler.wb_ANDI.html" class="xref" title="ANDI - Logical AND with Immediateand">ANDI</a> with K complemented)

### <a href="" id="N142A9"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | ⇔   | 0   | ⇔   | ⇔   | -   |
```
S: N ⊕ V, For signed tests.

V:0 Cleared

N:R7 Set if MSB of the result is set; cleared otherwise.

Z:

$\\overline{R7} \\overline{R6} \\overline{R5} \\overline{R4}$

$\\overline{R3} \\overline{R2} \\overline{R1} \\overline{R0}$

Set if the result is $00; cleared otherwise.

R (Result) equals Rd after the operation.

Example:

``` programlisting
cbr r16, $F0 ; Clear upper nibble of r16
cbr r18, 1 ; Clear bit 0 in r18
```

Words: 1 (2 bytes)

Cycles: 1
