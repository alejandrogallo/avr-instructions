AVR Assembler Instruction mnemonics
===================================

I/O Registers
-------------

### <a href="" id="avrassembler.RAMPX__RAMPY__RAMPZ"></a> <a href="" id="avrassembler.RAMPX__RAMPY__RAMPZ.abbrev"></a> RAMPX, RAMPY, RAMPZ

Registers concatenated with the X, Y and Z registers enabling indirect addressing of the whole data space on MCUs with more than 64K bytes data space, and constant data fetch on MCUs with more than 64K bytes program space.

### <a href="" id="avrassembler.RAMPD"></a> <a href="" id="avrassembler.RAMPD.abbrev"></a> RAMPD

Register concatenated with the Z register enabling direct addressing of the whole data space on MCUs with more than 64K bytes data space.

### <a href="" id="N12375"></a> EIND

Register concatenated with the instruction word enabling indirect jump and call to the whole program space on MCUs with more than 128K bytes program space.

### <a href="" id="avrassembler.Stack"></a> <a href="" id="avrassembler.Stack.abbrev"></a> Stack

STACK:Stack for return address and pushed registers

SP:Stack Pointer to STACK

### <a href="" id="N12384"></a> Flags

&lt;&gt; :Flag affected by instruction

0 :Flag cleared by instruction

1 :Flag set by instruction

- :Flag not affected by instruction
