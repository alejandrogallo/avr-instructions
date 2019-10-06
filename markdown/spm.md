AVR Assembler Instructions
==========================

SPM - Store Program Memory
--------------------------

### <a href="" id="N198D0"></a> Description:

SPM can be used to erase a page in the program memory, to write a page in the program memory (that is already erased), and to set boot loader lock bits. In some devices, the program memory can be written one word at a time, in other devices an entire page can be programmed simultaneously after first filling a temporary page buffer. In all cases, the program memory must be erased one page at a time. When erasing the program memory, the <a href="avrassembler.wb_registers.html#avrassembler.RAMPX__RAMPY__RAMPZ" class="xref" title="RAMPX, RAMPY, RAMPZ">RAMPX, RAMPY, RAMPZ</a> and Z register are used as page address. When writing the program memory, the RAMPZ and Z register are used as page or word address, and the R1:R0 register pair is used as data. R1 determines the instruction high byte, and R0 determines the instruction low byte… When setting the boot loader lock bits, the R1:R0 register pair is used as data. Refer to the device documentation for detailed description of SPM usage. This instruction can address the entire program memory.

This instruction is not available in all devices. Refer to the device specific instruction set summary.

R1 determines the instruction high byte, and R0 determines the instruction low byte.

Operation: Comment:

(i)(RAMPZ:Z) ← $ffff Erase program memory pagerns21i

(ii)(RAMPZ:Z) ← R1:R0 Write program memory word

(iii)(RAMPZ:Z) ← R1:R0 Write temporary page buffer

(iv)(RAMPZ:Z) ← TEMP Write temporary page buffer to program memory

(v)BLBITS ← R1:R0 Set boot loader lock bits

Syntax: Operands: Program Counter:

(i)-(v) SPM None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 1110 | 1000 |
```
Status Register (SREG) and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
 ;This example shows SPM write of one page for devices with page write
 ;- the routine writes one page of data from RAM to Flash
 ; the first data location in RAM is pointed to by the Y pointer
 ; the first data location in Flash is pointed to by the Z pointer
 ;- error handling is not included
 ;- the routine must be placed inside the boot space
 ; (at least the do_spm sub routine)
 ;- registers used: r0, r1, temp1, temp2, looplo, loophi, spmcrval
 ; (temp1, temp2, looplo, loophi, spmcrval must be defined by the user)
 ; storing and restoring of registers is not included in the routine
 ; register usage can be optimized at the expense of code size
 .equ PAGESIZEB = PAGESIZE*2;PAGESIZEB is page size in BYTES, not words
 .org SMALLBOOTSTART
 write_page:
;page erase
ldi spmcrval, (1<<PGERS) + (1<<SPMEN)
call do_spm
 ;transfer data from RAM to Flash page buffer
ldi looplo, low(PAGESIZEB) ;init loop variable
ldi loophi, high(PAGESIZEB) ;not required for PAGESIZEB<=256
 wrloop:ld r0, Y+
ld r1, Y+
ldi spmcrval, (1<<SPMEN)
call do_spm
adiw ZH:ZL, 2
sbiw loophi:looplo, 2;use subi for PAGESIZEB<=256
brne wrloop
 ;execute page write
subi ZL, low(PAGESIZEB) ;restore pointer
sbci ZH, high(PAGESIZEB) ;not required for PAGESIZEB<=256
ldi spmcrval, (1<<PGWRT) + (1<<SPMEN)
call do_spm
;read back and check, optional
ldi looplo, low(PAGESIZEB) ;init loop variable
ldi loophi, high(PAGESIZEB) ;not required for PAGESIZEB<=256
subi YL, low(PAGESIZEB) ;restore pointer
sbci YH, high(PAGESIZEB)
 rdloop:lpmr0, Z+
ldr 1, Y+
cp ser0, r1
jmp error
sbi wloophi:looplo, 2;use subi for PAGESIZEB<=256
brne rdloop
 ;return
ret
 do_spm:
 ;input: spmcrval determines SPM action
 ;disable interrupts if enabled, store status
in temp2, SREG
cli
;check for previous SPM complete
 wait:intemp1, SPMCR
sbr ctemp1, SPMEN
rjm pwait
;SPM timed sequence
out SPMCR, spmcrval
spm
 ;restore SREG (to enable interrupts if originally enabled)
out SREG, temp2
ret
```

Words: 1 (2 bytes)

Cycles: depends on the operation
