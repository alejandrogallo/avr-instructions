AVR Assembler AVR Assembler Preprocessor
========================================

\#error, \#warning and \#message
--------------------------------

### <a href="" id="N10B3B"></a> Syntax

`       #error tokens      `

`       #warning tokens      `

`       #message tokens      `

### <a href="" id="N10B4C"></a> Description

`       #error      ` emits tokens to standard error, and increments the assembler error counter, hereby preventing the program from being successfully assembled. `       #error      ` is specified in the ANSI C standard.

`       #warning      ` emits tokens to standard error, and increments the assembler warning counter. `       #warning      ` is not specified in the ANSI C standard, but is commonly implemented in preprocessors such as the GNU C preprocessor.

`       #message      ` emits tokens to standard output, and does not affect assembler error or warning counters. `       #message      ` is not specified in the ANSI C standard.

For all directives, the output will include file name and line number, like normal error and warning messages.

tokens is a sequence of preprocessor tokens. Preprocessor macros are expanded except if appearing inside quoted strings `       (")      ` .

### <a href="" id="N10B6D"></a> Example

`       #error "Unsupported part:" __PART_NAME__      `
