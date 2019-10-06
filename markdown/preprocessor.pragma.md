AVR Assembler AVR Assembler Preprocessor
========================================

\#pragma, general purpose
-------------------------

### <a href="" id="N10BB1"></a> Syntax

1.  `          #pragma warning range byte option         `

2.  `          #pragma overlap option         `

3.  `          #pragma error instruction         `

4.  `          #pragma warning instruction         `

### <a href="" id="N10BCE"></a> Description

```
1.  The assembler evaluates constant integer expressions as 64-bit signed integers internally. When such expressions are used as immediate operands, they must be truncated to the number of bits required by the instructions. For most operands, an out-of -range value will cause an “operand out of range” error message. However, the immediate byte operands for the <a href="avrassembler.wb_LDI.html" class="xref" title="LDI - Load Immediate">LDI</a> , <a href="avrassembler.wb_CPI.html" class="xref" title="CPI- Compare with Immediate">CPI</a> , <a href="avrassembler.wb_ORI.html" class="xref" title="ORI- Logical OR with Immediate">ORI</a> , <a href="avrassembler.wb_ANDI.html" class="xref" title="ANDI - Logical AND with Immediateand">ANDI</a> , <a href="avrassembler.wb_SUBI.html" class="xref" title="SUBI- Subtract Immediate">SUBI</a> , <a href="avrassembler.wb_SBCI.html" class="xref" title="SBCI- Subtract Immediate with Carry">SBCI</a> instructions have several possible interpretations that are affected by this option. option= integer The immediate operand is evaluated as an integer, and if its value is outside the range \[-128 … 255\] a warning is given. The assembler doesn’t know if the users intends an integer operand to be signed or unsigned, hence it allows any signed or unsigned value that fits into a byte. option= overflow (default): The immediate operand is basically evaluated as an unsigned byte, and any sign extension bits are ignored. This option is particularly suitable when dealing with bit masks, when the integer interpretation would cause lots of warnings, like `          ldi r16, ~((1 << 7) | (1 << 3))         ` <span class="command"> **option=none** </span> Disables all out-of-range warnings for byte operands. Not recommended.
```
2.  If different sections of code are mapped to overlapping memory locations using the <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.ORG" class="xref" title="ORG - Set program origin">ORG</a> directive, an error message is normally issued. This options modifies that behaviour as follows: option= ignoreIgnores overlap conditions altogether; no errors, no warnings. Not recommended. option= warningProduce warnings when overlaps are detected. <span class="command"> **option=error** </span> Consider overlaps as error condition; this is the default and recommended setting. <span class="command"> **option=default** </span> Revert to default handling -erroror whatever is specified with the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.O" class="xref" title="-O i|w|e">-O</a> . The assembler maintains two settings for overlap handling: Thedefaultsetting that is set up by the -O command-line option, and theeffectivesetting, that only can be modified with this \#pragma. The two settings are equal upon assembler invocation, this \#pragma changes the effective setting from the line it is invoked and until the line it is changed by another invocation of this pragma. Hence, this pragma covers source line ranges and not address ranges. See also: <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.OVERLAP" class="xref" title="OVERLAP/NOOVERLAP - Set up overlapping section">OVERLAP/NOOVERLAP</a> .

3.  Causes use of instructions that are unsupported on the specified device to cause an assembler error (default behaviour)

4.  Causes use of instructions that are unsupported on the specified device to cause an assembler warning.

### <a href="" id="N10C0E"></a> See also

```
1.  <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.W" class="xref" title="-W-b |-W+bo | -W+bi">-W-b/-W+bi/o</a> .
```
2.  <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.O" class="xref" title="-O i|w|e">-O</a> .
