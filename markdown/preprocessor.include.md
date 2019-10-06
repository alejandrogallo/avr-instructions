AVR Assembler AVR Assembler Preprocessor
========================================

\#include
---------

### <a href="" id="N10B79"></a> Syntax

1.  `          #include "file"         `

2.  `          #include <file>         `

### <a href="" id="N10B8A"></a> Description

Include a file. The two forms differ in that (1) searches the current working directory first, and is functionally equivalent with the assembler <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.INCLUDE" class="xref" title="INCLUDE - Include another file">INCLUDE</a> directive. (2) does not search the current working directory unless explicitly specifying it with an “.” entry in the include path. Both forms will search a built-in known place after any explicitly specified path, this is the location for the partdef.inc include files supplied with the assembler.

It is strongly discouraged to use absolute pathnames in `       #include      ` directives, as this makes it difficult to move projects between different directories/computers. Use the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.I" class="xref" title="-I directory">-I</a> to specify the include path, or set ut up in <span class="guimenuitem"> Atmel Studio </span> - <span class="guimenuitem"> Project </span> - <span class="guimenuitem"> Assembler Options </span> .

### <a href="" id="N10BA3"></a> Examples

``` programlisting
#include <m48def.inc>
#include "mydefs.inc"
```
