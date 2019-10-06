AVR Assembler AVR Assembler Preprocessor
========================================

\#define
--------

### <a href="" id="N10A39"></a> Syntax:

1.  `          #define name [value]         `

2.  `          #define name(arg, ...) [value]         `

### <a href="" id="N10A4A"></a> Description:

Define a preprocessor macro. There are two forms of macros, (1) object-like macros that basically define a constant, and (2) function-like macros that do parameter substitution.

value may be any string, it is not evaluated until the macro is expanded (used). If value is not specified, it is set to 1.

Form (1) macros may be defined from the command line, using the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.D" class="xref" title="-D name[=value] -U name">-D</a> .

When form (2) is used, the macro must be called with the same number of arguments it is defined with. Any occurrences of arg in value will be replaced with the corresponding arg when the macro is called. Note that the left parenthesis must appear immediately after name (no spaces between), otherwise it will be interpreted as part of the value of a form (1) macro.

### <a href="" id="N10A57"></a> Examples

Note that the placement of the first ‘(’ is very significant in the examples below.

1.  \#define EIGHT (1 &lt;&lt; 3)

2.  \#define SQR(X) ((X)\*(X))
