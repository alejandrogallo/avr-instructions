AVR Assembler AVR Assembler Preprocessor
========================================

\#undef
-------

### <a href="" id="N10A6A"></a> Syntax

`       #undef name      `

### <a href="" id="N10A71"></a> Description

Undefine macro name previously defined with a `       #define      ` directive. If name is not previously defined, the `       .undef      ` directive is silently ignored, this behaviour is in accordance with the ANSI C standard. Macros may also be undefined from the command line using the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.D" class="xref" title="-D name[=value] -U name">-D</a> .
