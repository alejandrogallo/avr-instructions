AVR Assembler Instructions
==========================

MOVW - Copy Register Word
-------------------------

### <a href="" id="N1713B"></a> Description:

This instruction makes a copy of one register pair into another register pair. The source register pair Rr+1:Rr is left unchanged, while the destination register pair Rd+1:Rd is loaded with a copy of Rr + 1:Rr.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

Operation:

(i) Rd+1:Rd ← Rr+1:Rr

Syntax: Operands: Program Counter:

(i) MOVW Rd+1:Rd,Rr+1Rr d E {0,2,…,30}, r E {0,2,…,30} PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 0000 | 0001 | dddd | rrrr |
```
### <a href="" id="N17170"></a> Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
movw r17:16,r1:r0 ; Copy r1:r0 to r17:r16
call check ; Call subroutine
...
check: cpi r16,$11 ; Compare r16 to $11
...
cpi r17,$32 ; Compare r17 to $32
...
ret ; Return from subroutine
```

Words: 1 (2 bytes)

Cycles: 1
