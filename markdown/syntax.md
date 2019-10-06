AVR Assembler AVR Assembler Syntax
==================================

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Keywords" class="xref" title="Keywords">Keywords</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Preprocessor_directives" class="xref" title="Preprocessor directives">Preprocessor</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Comments" class="xref" title="Comments">Comments</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Line_continuation" class="xref" title="Line continuation">Line</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Strings_and_character_constants" class="xref" title="Strings and character constants">Strings and character constants</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Multiple_instructions_per_line" class="xref" title="Multiple instructions per line">Multiple</a>

-   <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Operands" class="xref" title="Operands">Operands</a>

Keywords
--------

Predefined identifiers (keywords) are reserved and cannot be redefined. The keywords include all <a href="avrassembler.wb_instructions.html" class="xref" title="Instruction mnemonics">Instruction mnemonics</a> , <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Functions" class="xref" title="Functions">Functions</a> .

Assembler keywords are recognized regardless of case, unless the <a href="avrassembler.wb_Command_Line_Options.html#avrassembler.wb_Command_Line_Options.c" class="xref" title="-c">-c</a> option is used, in which case the keywords are lower case (i.e., “add” is reserved, “ADD” is not).

Preprocessor directives
-----------------------

AVRASM2 considers all lines starting with a ‘\#’ as the first non-space character a <a href="avrassembler.wb_directives.html" class="link" title="Assembler directives">preprocessor directive</a> .

Comments
--------

In addition to the classic assembler comments starting with ‘;’, AVRASM2 recognizes C-style comments. The following comment styles are recognized:

``` programlisting
; The rest of the line is a comment (classic assembler comment)
// Like ';', the rest of the line is a comment
/* Block comment; the enclosed text is a comment, may span 
multiple lines.This style of comments cannot be nested. */
```

Line continuation
-----------------

Like in C, source lines can be continued by means of having a backslash (\\) as the last character of a line. This is particularly useful when defining long preprocessor macros, and for long `       .db      ` directives. <span class="bold"> **** </span>

<span class="bold"> **Example:** </span>

``` programlisting
.db 0, 1, "This is a long string", '\n', 0, 2, \ 
"Here is another one", '\n', 0, 3, 0
```

Integer constants
-----------------

AVRASM2 allows underscores (\_) to be used as separators for increased readability. Underscores may be located anywhere in the number except as the first character or inside the radix specifier.

<span class="bold"> **Example:** </span> `       0b1100_1010      ` and `       0b_11_00_10_10_      ` are both legal, while `       _0b11001010      ` and `       0_b11001010      ` are not.

Strings and character constants
-------------------------------

A string enclosed in double quotes (") can only be used in conjunction with the <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.DB" class="xref" title="DB - Define constant byte(s) in program memory and EEPROM">DB</a> directive and the <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.MESSAGE" class="xref" title="MESSAGE - Output a message string">MESSAGE</a> /. <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.WARNING" class="xref" title="WARNING - Outputs a warning message string">WARNING</a> / <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.ERROR" class="xref" title="ERROR- Outputs an error message string">ERROR</a> directives. The string is taken literally, no escape sequences are recognized, and it is not NULL-terminated.

Quoted strings may be concatenated according to the ANSI C convention, i.e., `       "This is a " "long string"      ` is equivalent to `       "This   is a long string"      ` .This may be combined with <a href="avrassembler.wb_Syntax.html#avrassembler.wb_Syntax.Line_continuation" class="xref" title="Line continuation">Line</a> to form long strings spanning multiple source lines.

Character constants are enclosed in single quotes (’), and can be used anywhere an integer expression is allowed. The following C-style escape sequences are recognized, with the same meaning as in C:

```
| Escape sequence | Meaning                         |
|-----------------|---------------------------------|
| \\n             | Newline (ASCII LF 0x0a)         |
| \\r             | Carriage return (ASCII CR 0x0d) |
| \\a             | Alert bell (ASCII BEL 0x07)     |
| \\b             | Backspace (ASCII BS 0x08)       |
| \\f             | Form feed (ASCII FF 0x0c)       |
| \\t             | Horizontal tab (ASCII HT 0x09)  |
| \\v             | Vertical tab (ASCII VT 0x0b)    |
| \\\\            | Backslash                       |
| \\0             | Null character (ASCII NUL)      |
```
\\ooo (ooo = octal number) and \\xhh (hh = hex number) are also recognized.

<a href="" id="N1037B"></a> Examples
------------------------------------

``` programlisting
.db "Hello\n" // is equivalent to:
.db 'H', 'e', 'l', 'l', 'o', '\\', 'n'
.db '\0', '\177', '\xff'
```

To create the equivalent to the C-string “Hello, world\\n”, do as follows:

``` programlisting
.db "Hello, world", '\n', 0
```

Multiple instructions per line
------------------------------

AVRASM2 allows multiple instructions and directives per line, but its use is not recommended. It is needed to support expansion of multiline preprocessor macros.

Operands
--------

AVRASM2 has support for integer <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Operands" class="link" title="Operands">operands</a> and limited support for floating point constant expressions. All operands are described <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Operands" class="xref" title="Operands">Operands</a> .
