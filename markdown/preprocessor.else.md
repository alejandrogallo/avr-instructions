AVR Assembler AVR Assembler Preprocessor
========================================

\#else
------

### <a href="" id="N10B03"></a> Syntax

`       #else      `

### <a href="" id="N10B0A"></a> Description

All following lines until the corresponding `       #endif      ` are conditionally assembled if no previous branch in a compound `       #if … #elif …      ` sequence has been evaluated to true.

### <a href="" id="N10B14"></a> Example

``` programlisting
#if defined(__ATmega48__) || defined(__ATmega88__) 
// code specific for these parts 
#elif defined (__ATmega169__) 
// code specific for ATmega169 
#else 
#error "Unsupported part:" __PART_NAME__ 
#endif // part specific code
```
