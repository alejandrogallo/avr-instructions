AVR Assembler AVR Assembler Preprocessor
========================================

\#pragma , AVR part related
---------------------------

### <a href="" id="N10C24"></a> Syntax

1.  `          #pragma AVRPART ADMIN PART_NAME string         `

2.  `          #pragma AVRPART CORE CORE_VERSION version-string         `

3.  `          #pragma AVRPART CORE INSTRUCTIONS_NOT_SUPPORTED mnemonic[ operand[,operand]                   ][:...]         `

4.  `          #pragma AVRPART CORE NEW_INSTRUCTIONS mnemonic[ operand[,operand]][:...]         `

5.  `          #pragma AVRPART MEMORY PROG_FLASH size         `

6.  `          #pragma AVRPART MEMORY EEPROM size         `

7.  `          #pragma AVRPART MEMORY INT_SRAM SIZE size         `

8.  `          #pragma AVRPART MEMORY INT_SRAM START_ADDRaddress         `

9.  `          #pragma partinclude num         `

### <a href="" id="N10C5F"></a> Description

These directives are used to specify various part-specific properties, and are normally used in the part definition include files (partdef.inc). Normally, there is no reason to use these pragmas directly in user programs.

Preprocessor macros are not allowed in pragmas. Expressions are not allowed for the numeric arguments, must be pure numbers in decimal, hex, octal, or binary format. String arguments must not be quoted. The pragmas specify the following part-specific properties:

1.  The part name, e.g., ATmega8

2.  The AVR Core version. This defines the basic instruction set supported. Allowed core versions are currently V0, V0E, V1, V2, and V2E.

3.  Colon-separated list of instructions not supported by this part, relative to the core version.

4.  Colon-separated list of additional instructions supported by this part, relative to the core version.

5.  FLASH program memory size, in bytes.

6.  EEPROM memory size, in bytes.

7.  SRAM memory size, in bytes.

8.  SRAM memory start address. 0x60 for basic AVR parts, 0x100 or more for parts with extended I/O.

9.  For AVRASM1 compatibility. Default value: 0. If set to 1, it will cause the <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.DEF" class="link" title="DEF - Set a symbolic name on a register">DEVICE</a> directive to include a file called device.h that is expected to contain the `          #pragma         ` s described above. This enables partdef.inc files designed for AVRASM1 (containing a <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.DEF" class="link" title="DEF - Set a symbolic name on a register">DEVICE</a> directive but no part-describing `          #pragma         ` s) to be used with AVRASM2. This property can also be set using the <a href="avrassembler.wb_Command_Line_Options.html" class="xref" title="AVR Assembler Command Line Options"><em>AVR Assembler Command Line Options</em></a> command line option, and is implicitly set when using the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.onetwo" class="xref" title="-1 -2 [Deprecated]">-1/-2</a>

### <a href="" id="N10C97"></a> Examples

Note that the combination of these examples does not describe a real AVR part!

1.  `          #pragma AVRPART ADMIN PART_NAME ATmega32         `

2.  `          #pragma AVRPART CORE CORE_VERSION V2         `

3.  `          #pragma AVRPART CORE INSTRUCTIONS_NOT_SUPPORTED movw:break:lpm rd,z         `

4.  `          #pragma AVRPART CORE NEW_INSTRUCTIONS lpm rd,z+         `

5.  `          #pragma AVRPART MEMORY PROG_FLASH 131072         `

6.  `          #pragma AVRPART MEMORY EEPROM 4096         `

7.  `          #pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60         `

8.  `          #pragma AVRPART MEMORY INT_SRAM SIZE 4096         `
