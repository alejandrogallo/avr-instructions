AVR Assembler AVR Assembler Preprocessor
========================================

\#ifndef
--------

### <a href="" id="N10AA5"></a> Syntax

`       #ifndef name      `

### <a href="" id="N10AAC"></a> Description

The opposite of `       #ifdef      ` : All following lines until the corresponding `       #endif      ` , `       #else      ` , or `       #elif      ` are conditionally assembled if name is not `       #defined      ` . Shorthand for `       #if      ` !defined(name)
