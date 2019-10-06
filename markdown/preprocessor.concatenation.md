AVR Assembler Operators
=======================

### Concatenation (\#\#)

The concatenation operator concatenates two preprocessor tokens, forming a new token. It is most useful when at least one of the tokens are a parameter to a function-type macro.

#### <a href="" id="N10D0E"></a> Example

`       #define FOOBAR subi      `

1.  `          #define IMMED(X) X##i         `

2.  `          #define SUBI(X,Y) X ## Y         `

When the IMMED and SUBI macros are called like this:

1.  `          IMMED(ld) r16,1         `

2.  `          SUBI(FOO,BAR) r16,1         `

they will be expanded to

1.  `          ldi r16,0x1         `

2.  r `          subi r16,0x1         `

#### <a href="" id="N10D46"></a> Notes

1.  The concatenation operator cannot appear first or last in a macro expansion

2.  When used on a function-type macro argument, the argument will be used literally, i.e., it will not be expanded before concatenation.

3.  The token formed by the concatenation willbe subject to further expansion. In example 2 above, the parameters FOO and BAR are first concatenated to FOOBAR, then FOOBAR is expanded to subi.
