AVR Assembler Instruction mnemonics
===================================

Instruction Set Nomenclature:
-----------------------------

### <a href="" id="avrassembler.Status_Register"></a> <a href="" id="avrassembler.Status_Register.abbrev"></a> SREG : Status register

C : Carry flag in status register

Z : Zero flag in status register

N : Negative flag in status register

V : Two’s complement overflow indicator

S : N \[+\] V, For signed tests

H : Half Carry flag in the status register

T : Transfer bit used by BLD and BST instructions

I : Global interrupt enable/disable flag

### <a href="" id="N123AD"></a> Registers and Operands

Rd : Destination (and source) register in the register file

Rr : Source register in the register file

R : Result after instruction is executed

K : Constant data

k : Constant address

b : Bit in the register file or I/O register (3 bit)

s: Bit in the status register (3 bit)

X,Y,Z : Indirect address register (X=R27:R26, Y=R29:R28 and Z=R31:R30)

A : I/O location address

q : Displacement for direct addressing (6 bit)
