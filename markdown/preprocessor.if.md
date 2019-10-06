AVR Assembler AVR Assembler Preprocessor
========================================

\#if and \#elif
---------------

### <a href="" id="N10AC7"></a> Syntax

`       #if condition      `

`       #elif condition      `

### <a href="" id="N10AD3"></a> Description

All following lines until the corresponding `       #endif      ` , `       #else      ` , or `       #elif      ` are conditionally assembled if condition is true (not equal to 0). condition may be any integer expression, including preprocessor macros which are expanded. <span class="emphasis"> *The preprocessor recognizes the special operator defined(name)that returns 1 if name is `         #define        ` d and 0 otherwise. Any un `         #define        ` d symbols used in condition are silently evaluated to 0.* </span>

Conditionals may be nested to arbitrary depth.

`       #elif      ` evaluates condition in the same manner as `       #if      ` , except that it is only evaluated if no previous branch of a compound `       #if … #elif      ` sequence has been evaluated to true.

### <a href="" id="N10AF6"></a> Examples

``` programlisting
#if 0 
// code here is never included 
#endif

#if defined(__ATmega48__) || defined(__ATmega88__) 
// code specific for these devices 
#elif defined (__ATmega169__) 
// code specific for ATmega169 
#endif // device specific code
```
