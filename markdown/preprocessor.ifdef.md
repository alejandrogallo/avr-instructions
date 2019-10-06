AVR Assembler AVR Assembler Preprocessor
========================================

\#ifdef
-------

### <a href="" id="N10A83"></a> Syntax

`       #ifdef name      `

### <a href="" id="N10A8A"></a> Description

All following lines until the corresponding `       #endif      ` , `       #else      ` , or `       #elif      ` are conditionally assembled if name is previously \#defined. Shorthand for \#if defined(name)

### <a href="" id="N10A97"></a> Example

``` programlisting
#ifdef FOO
// do something
#endif
```
