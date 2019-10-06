AVR Assembler Operators
=======================

### Stringification (\#)

The stringification operators makes a quoted string token of a parameter to a function-type macro

#### <a href="" id="N10CE7"></a> Example

`       #define MY_IDENT(X) .db #X, '\n', 0      `

When called like this

`       MY_IDENT(FooFirmwareRev1)      `

will expand to

`       .db "FooFirmwareRev1", '\n', 0      `

#### <a href="" id="N10CFC"></a> Notes

1.  Stringification can only be used with parameters to function-type macros

2.  The parameter’s value will be used literally, i.e. it will not be expanded before stringification.
