AVR Assembler AVR Assembler Known Issues
========================================

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.Issue_4146" class="xref" title="Issue #4146: Line continuation doesn&#39;t work in macro calls">Line continuation doesn’t work in macro calls</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.Missing_newline_at_end_of_file" class="xref" title="Missing newline at end of file">Missing newline at end of file</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.decrement" class="xref" title="Increment/decrement operators">Increment/decrement operators</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.Forward_references" class="xref" title="Forward references in conditionals">Forward references in conditionals</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.Error_messages" class="xref" title="Error messages">Error messages</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.defined" class="xref" title="defined incorrectly treated as an assembler keyword">defined</a>

-   <a href="avrassembler.wb_Known_Issues.html#avrassembler.wb_Known_Issues.Preprocessor_issues" class="xref" title="Preprocessor issues">Preprocessor issues</a>

Issue \#4146: Line continuation doesn’t work in macro calls
-----------------------------------------------------------

The following program illustrates this issue.

``` programlisting
.macro m 
ldi @0, @1 
.endm m r16,\ 0
```

This is not a problem with preprocessor macros ( `       #define      ` ).

Missing newline at end of file
------------------------------

AVRASM2 has some issues if the last line in a source file is missing a newline: Error messages may refer to wrong filename/line number if the error is in the last line of a included files, and in some cases syntax errors may result. Beware that the Atmel Studio editor will not append a missing newline at the end of a source file automatically.

Increment/decrement operators
-----------------------------

Increment/decrement operators (++/–) are recognized by the assembler and may cause surprises, e.g. symbol–1 will cause a syntax error, writesymbol - -1 if that is what is intended. This behaviour is consistent with C compilers. The ++/– operators are not useful in the current assembler, but are reserved for future use.

Forward references in conditionals
----------------------------------

Using a forward reference in an assembler conditional may cause surprises, and in some cases is not allowed. Example:

``` programlisting
.org LARGEBOOTSTART
; the following sets up RAMPZ:Z to point to a FLASH data object, typically
; for use with ELPM.
        
ldi ZL, low (cmdtable * 2)
        
ldi ZH, high (cmdtable * 2)
.if ((cmdtable * 2) > 65535)
        
ldi r16, 1
        
sts RAMPZ, r16
.endif
        
; more code follows here
cmdtable: .db "foo", 0x0
```

The reason for this is that the outcome of the conditional will influence the value of the forward referenced label, which in turn may affect the outcome of the conditional, and so on.

The following is allowed:

``` programlisting
.ifdef FOO 
nop ; some code here 
.endif 
rjmp label ; more code here 
.equ FOO = 100 
label: nop
```

In this example FOO is not defined at the point it is used in a conditional. The use of .ifdef in this situation is allowed, and the conditional is false. However, the pattern shown above is not recommended because the programmer’s intention is not clear. The form is intended to allow common constructs like this:

``` programlisting
; Define FOO if it is not already defined. 
.ifndef FOO 
.equ FOO = 0x100 
.endif
```

Up to and including AVRASM 2.0.30, these situations were not always properly detected, causing incomprehensible error messages. Starting with 2.0.31, explicit error messages are given.

Note that with preprocessor conditionals ( `       #if/#ifdef      ` ), the situation is always well-defined, preprocessor symbols are always undefined until the definition is seen. and this kind of error will never occur.

Error messages
--------------

Sometimes error messages may be hard to understand. Typically, a simple typo in some instances may produce error messages like this:

`       myfile.asm(30): error: syntax error, unexpected   FOO      `

where FOO represents some incomprehensible gibberish. The referenced filename/line number is correct, however.

defined incorrectly treated as an assembler keyword
---------------------------------------------------

The keyword <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.DEFINED_symbol" class="xref">DEFINED(symbol)</a> is recognized in all contexts, it should only be recognized in conditionals. This prevents <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.DEFINED_symbol" class="xref">DEFINED(symbol)</a> to be used as a user symbol like a label, etc. On the other hand, it allows for constructs like ‘.dw foo = defined(bar)’ which it shouldn’t. Note that the preprocessor and assembler have separate implementations of <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.DEFINED_symbol" class="xref">DEFINED(symbol)</a> . The exact behaviour of <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.DEFINED_symbol" class="xref">DEFINED(symbol)</a> currently (from 2.1.5) is:

-   The preprocessor ‘defined’ keyword only relates to symbols defined with `          #define         ` , and correctly does this only in preprocessor conditionals ( `          #if/#elif         ` ).

-   In all remaining code, the assembler’s notion of <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.DEFINED_symbol" class="xref">DEFINED(symbol)</a> is used, the correct behaviour would be to only recognize it in assembler conditionals ( `          .if/.elif         ` ).

Preprocessor issues
-------------------

-   The preprocessor will not detect invalid preprocessor directives inside a false conditional. This may lead to surprises with typos like this:

    ``` programlisting
    #if __ATmega8__ 
    //... 
    #elseif __ATmega16__ //WRONG, the correct directive is #elif 
    // This will go undetected if __ATmega8__ is false 
    //... 
    #else 
    // when __ATmega8__ is false this section will be assembled even if 
    // __ATmega16__ is true. 
    #endif 
    ```

    It is debatable if this is a bug, the behaviour is consistent with the C preprocessor.

-   Issue \#3361: The preprocessor incorrectly allows additional text after directives, which may cause surprises, e.g., \#endif \#endif will be interpreted as a single \#endif directive, without any error or warning message.

-   Issue \#4741: Assembler conditionals in preprocessor macros don’t work Use of the macro defined below will result in different syntax error messages, depending on the value of the conditional val (true or false)

    ``` programlisting
    #define TEST \
    .IF val \
    .DW 0 \
    .ELSE \
    .DW 1 \
    .ENDIF
    ```

    The reason for this is that assembler conditionals must appear on a separate line, and a preprocessor macro like the above is concatenated into a single line.
