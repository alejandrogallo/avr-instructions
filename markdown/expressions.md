AVR Assembler Expressions
=========================

The Assembler incorporates constant expressions. Expressions can consist of <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Operands" class="link" title="Operands">operands</a> , <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Operators" class="link" title="Operators">operators</a> and <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Functions" class="link" title="Functions">functions</a> . All expressions are 64 bits internally.

Operands
--------

The following operands can be used:

-   User defined labels which are given the value of the location counter at the place they appear.

-   User defined variables defined by the SET directive

-   User defined constants defined by the EQU directive

-   Integer constants: constants can be given in several formats, including

-   

    -   Decimal (default): 10, 255

    -   Hexadecimal (two notations): 0x0a, $0a, 0xff, $ff

    -   Binary: 0b00001010, 0b11111111

    -   Octal (leading zero): 010, 077

-   PC - the current value of the Program memory location counter

-   Floating point constants

Operators
---------

The Assembler supports a number of operators which are described here. The higher the precedence, the higher the priority. Expressions may be enclosed in parentheses, and such expressions are always evaluated before combined with anything outside the parentheses. The associativity of binary operators indicates the evaluation order of chained operators, left associativity meaning they are evaluated left to right, i.e., 2 - 3 - 4 is (2 - 3) - 4, while right associativity would mean 2-3-4 is 2 - (3 - 4). Some operators are not assoiciative, meaning chaining has no meaning.

The following operators are defined:

```
| <span class="bold"> **Symbol** </span>                                                                                                      | <span class="bold"> **Description** </span>                                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="avrassembler.wb_expressions.html#avrassembler.Logical_Not" class="link" title="Logical Not">!</a>                                  | <a href="avrassembler.wb_expressions.html#avrassembler.Logical_Not" class="link" title="Logical Not">Logical not</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Not" class="link" title="Bitwise Not">~</a>                                  | <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Not" class="link" title="Bitwise Not">Bitwise Not</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Unary_Minus" class="link" title="Unary Minus">-</a>                                  | <a href="avrassembler.wb_expressions.html#avrassembler.Unary_Minus" class="link" title="Unary Minus">Unary Minus</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Multiplication" class="link" title="Multiplication">*</a>                            | <a href="avrassembler.wb_expressions.html#avrassembler.Multiplication" class="link" title="Multiplication">Multiplication</a>                                  |
| <a href="avrassembler.wb_expressions.html#avrassembler.Division" class="link" title="Division">/</a>                                        | <a href="avrassembler.wb_expressions.html#avrassembler.Division" class="link" title="Division">Division</a>                                                    |
| <a href="avrassembler.wb_expressions.html#avrassembler.Modulo" class="link" title="Modulo">%</a>                                            | <a href="avrassembler.wb_expressions.html#avrassembler.Modulo" class="link" title="Modulo">Modulo ( AVR Assembler 2 only)</a>                                  |
| <a href="avrassembler.wb_expressions.html#avrassembler.Addition" class="link" title="Addition">+</a>                                        | <a href="avrassembler.wb_expressions.html#avrassembler.Addition" class="link" title="Addition">Addition</a>                                                    |
| <a href="avrassembler.wb_expressions.html#avrassembler.Subtraction" class="link" title="Subtraction">-</a>                                  | <a href="avrassembler.wb_expressions.html#avrassembler.Subtraction" class="link" title="Subtraction">Subtraction</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Shift_left" class="link" title="Shift left">&lt;&lt;</a>                             | <a href="avrassembler.wb_expressions.html#avrassembler.Shift_left" class="link" title="Shift left">Shift left</a>                                              |
| <a href="avrassembler.wb_expressions.html#avrassembler.Shift_right" class="link" title="Shift right">&gt;&gt;</a>                           | <a href="avrassembler.wb_expressions.html#avrassembler.Shift_right" class="link" title="Shift right">Shift right</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Less_than" class="link" title="Less than">&lt;</a>                                   | <a href="avrassembler.wb_expressions.html#avrassembler.Less_than" class="link" title="Less than">Less than</a>                                                 |
| <a href="avrassembler.wb_expressions.html#avrassembler.Less_or_Equal" class="link" title="Less or equal">&lt;=</a>                          | <a href="avrassembler.wb_expressions.html#avrassembler.Less_or_Equal" class="link" title="Less or equal">Less than or equal</a>                                |
| <a href="avrassembler.wb_expressions.html#avrassembler.Greater_than" class="link" title="Greater than">&gt;</a>                             | <a href="avrassembler.wb_expressions.html#avrassembler.Greater_than" class="link" title="Greater than">Greater than</a>                                        |
| <a href="avrassembler.wb_expressions.html#avrassembler.Greater_or_equal" class="link" title="Greater or equal">&gt;=</a>                    | <a href="avrassembler.wb_expressions.html#avrassembler.Greater_or_equal" class="link" title="Greater or equal">Greater than or equal</a>                       |
| <a href="avrassembler.wb_expressions.html#avrassembler.Equal" class="link" title="Equal">==</a>                                             | <a href="avrassembler.wb_expressions.html#avrassembler.Equal" class="link" title="Equal">Equal</a>                                                             |
| <a href="avrassembler.wb_expressions.html#avrassembler.Not_equal" class="link" title="Not equal">!=</a>                                     | <a href="avrassembler.wb_expressions.html#avrassembler.Not_equal" class="link" title="Not equal">Not equal</a>                                                 |
| <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_And" class="link" title="Bitwise And">&amp;</a>                              | <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_And" class="link" title="Bitwise And">Bitwise And</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Xor" class="link" title="Bitwise Xor">^</a>                                  | <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Xor" class="link" title="Bitwise Xor">Bitwise Xor</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Or" class="link" title="Bitwise Or">|</a>                                    | <a href="avrassembler.wb_expressions.html#avrassembler.Bitwise_Or" class="link" title="Bitwise Or">Bitwise Or</a>                                              |
| <a href="avrassembler.wb_expressions.html#avrassembler.Logical_And" class="link" title="Logical And">&amp;&amp;</a>                         | <a href="avrassembler.wb_expressions.html#avrassembler.Logical_And" class="link" title="Logical And">Logical And</a>                                           |
| <a href="avrassembler.wb_expressions.html#avrassembler.Logical_Or" class="link" title="Logical Or">||</a>                                   | <a href="avrassembler.wb_expressions.html#avrassembler.Logical_Or" class="link" title="Logical Or">Logical Or</a>                                              |
| <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Conditional_operator" class="link" title="Conditional operator">?</a> | <a href="avrassembler.wb_expressions.html#avrassembler.wb_expressions.Conditional_operator" class="link" title="Conditional operator">Conditional operator</a> |
```
<a href="" id="avrassembler.Logical_Not"></a> Logical Not
---------------------------------------------------------

Symbol: !

Description: Unary operator which returns 1 if the expression was zero, and returns 0 if the expression was nonzero Precedence: 12

Associativity: None

Example: ldi r16,!0xf0 ; Load r16 with 0x00

<a href="" id="avrassembler.Bitwise_Not"></a> Bitwise Not
---------------------------------------------------------

Symbol: ~

Description: Unary operator which returns the input expression with all bits inverted

Precedence: 12

Associativity: None

Example: ldi r16,~0xf0 ; Load r16 with 0x0f

<a href="" id="avrassembler.Unary_Minus"></a> Unary Minus
---------------------------------------------------------

Symbol: -

Description: Unary operator which returns the arithmetic negation of an expression

Precedence: 14

Associativity: None

Example: ldi r16,-2 ; Load -2(0xfe) in r16

<a href="" id="avrassembler.Multiplication"></a> Multiplication
---------------------------------------------------------------

Symbol: \*

Description: Binary operator which returns the product of two expressions

Precedence: 13

Associativity: Left

Example: ldi r30,label\*2 ; Load r30 with label\*2

<a href="" id="avrassembler.Division"></a> Division
---------------------------------------------------

Symbol: /

Description: Binary operator which returns the integer quotient of the left expression divided by the right expression

Precedence: 13

Associativity: Left

Example: ldi r30,label/2 ; Load r30 with label/2

<a href="" id="avrassembler.Modulo"></a> Modulo
-----------------------------------------------

Symbol: %

Description: Binary operator which returns the integer remainder of the left expression divided by the right expression

Precedence: 13

Associativity: Left

Example: ldi r30,label%2 ; Load r30 with label%2

<a href="" id="avrassembler.Addition"></a> Addition
---------------------------------------------------

Symbol: +

Description: Binary operator which returns the sum of two expressions

Precedence: 12

Associativity: Left

Example: ldi r30,c1+c2 ; Load r30 with c1+c2

<a href="" id="avrassembler.Subtraction"></a> Subtraction
---------------------------------------------------------

Symbol: -

Description: Binary operator which returns the left expression minus the right expression

Precedence: 12

Associativity: Left

Example: ldi r17,c1-c2 ;Load r17 with c1-c2

<a href="" id="avrassembler.Shift_left"></a> Shift left
-------------------------------------------------------

Symbol: &lt;&lt;

Description: Binary operator which returns the left expression shifted left the number given by the right expression

Precedence: 11

Associativity: Left

Example: ldi r17,1&lt;&lt;bitmask ;Load r17 with 1 shifted left bitmask times

<a href="" id="avrassembler.Shift_right"></a> Shift right
---------------------------------------------------------

Symbol: &gt;&gt;

Description: Binary operator which returns the left expression shifted right the number given by the right expression

Precedence: 11

Associativity: Left

Example: ldi r17,c1&gt;&gt;c2 ;Load r17 with c1 shifted right c2 times

<a href="" id="avrassembler.Less_than"></a> Less than
-----------------------------------------------------

Symbol: &lt;

Description: Binary operator which returns 1 if the signed expression to the left is Less than the signed expression to the right, 0 otherwise

Precedence: 10

Associativity: None

Example: ori r18,bitmask\*(c1&lt;c2)+1 ;Or r18 with an expression

<a href="" id="avrassembler.Less_or_Equal"></a> Less or equal
-------------------------------------------------------------

Symbol: &lt;=

Description: Binary operator which returns 1 if the signed expression to the left is Less than or Equal to the signed expression to the right, 0 otherwise

Precedence: 10

Associativity: None

Example: ori r18,bitmask\*(c1&lt;=c2)+1 ;Or r18 with an expression

<a href="" id="avrassembler.Greater_than"></a> Greater than
-----------------------------------------------------------

Symbol: &gt;

Description: Binary operator which returns 1 if the signed expression to the left is Greater than the signed expression to the right, 0 otherwise

Precedence: 10

Associativity: None

Example: ori r18,bitmask\*(c1&gt;c2)+1 ;Or r18 with an expression

<a href="" id="avrassembler.Greater_or_equal"></a> Greater or equal
-------------------------------------------------------------------

Symbol: &gt;=

Description: Binary operator which returns 1 if the signed expression to the left is Greater than or Equal to the signed expression to the right, 0 otherwise

Precedence: 10

Associativity: None

Example: ori r18,bitmask\*(c1&gt;=c2)+1 ;Or r18 with an expression

<a href="" id="avrassembler.Equal"></a> Equal
---------------------------------------------

Symbol: ==

Description: Binary operator which returns 1 if the signed expression to the left is Equal to the signed expression to the right, 0 otherwise

Precedence: 9

Associativity: None

Example: andi r19,bitmask\*(c1==c2)+1 ;And r19 with an expression

<a href="" id="avrassembler.Not_equal"></a> Not equal
-----------------------------------------------------

Symbol: !=

Description: Binary operator which returns 1 if the signed expression to the left is Not Equal to the signed expression to the right, 0 otherwise

Precedence: 9

Associativity: None

Example: .SET flag=(c1!=c2) ;Set flag to 1 or 0

<a href="" id="avrassembler.Bitwise_And"></a> Bitwise And
---------------------------------------------------------

Symbol: &

Description: Binary operator which returns the bitwise And between two expressions

Precedence: 8

Associativity: Left

Example: ldi r18,High(c1&c2) ;Load r18 with an expression

<a href="" id="avrassembler.Bitwise_Xor"></a> Bitwise Xor
---------------------------------------------------------

Symbol: ^

Description: Binary operator which returns the bitwise Exclusive Or between two expressions

Precedence: 7

Associativity: Left

Example: ldi r18,Low(c1^c2) ;Load r18 with an expression

<a href="" id="avrassembler.Bitwise_Or"></a> Bitwise Or
-------------------------------------------------------

```
Symbol: |
```
Description: Binary operator which returns the bitwise Or between two expressions

Precedence: 6

Associativity: Left

```
Example: ldi r18,Low(c1|c2) ;Load r18 with an expression
```
<a href="" id="avrassembler.Logical_And"></a> Logical And
---------------------------------------------------------

Symbol: &&

Description: Binary operator which returns 1 if the expressions are both nonzero, 0 otherwise

Precedence: 5

Associativity: Left

Example: ldi r18,Low(c1&&c2) ;Load r18 with an expression

<a href="" id="avrassembler.Logical_Or"></a> Logical Or
-------------------------------------------------------

```
Symbol: ||
```
Description: Binary operator which returns 1 if one or both of the expressions are nonzero, 0 otherwise

Precedence: 4

Associativity: Left

```
Example: ldi r18,Low(c1||c2) ;Load r18 with an expression
```
Conditional operator
--------------------

Symbol: ? :

Syntax: condtion? expression1 : expression2

Description: Ternary operator which returns expression1 if condition is true, expression2 otherwise.

Precedence: 3

Associativity: None

Example:

ldi r18, a &gt; b? a : b ; Load r18 with the maximum numeric value of a and b. Note: This feature was introduced in AVRASM 2.1 and is not available in 2.0 or earlier versions.

Functions
---------

-   LOW(expression) returns the low byte of an expression

-   HIGH(expression) returns the second byte of an expression

-   BYTE2(expression) is the same function as HIGH

-   BYTE3(expression) returns the third byte of an expression

-   BYTE4(expression) returns the fourth byte of an expression

-   LWRD(expression) returns bits 0-15 of an expression

-   HWRD(expression) returns bits 16-31 of an expression

-   PAGE(expression) returns bits 16-21 of an expression

-   EXP2(expression) returns 2 to the power of expression

-   LOG2(expression) returns the integer part of log2(expression)

-   INT(expression) Truncates a floating point expression to integer (ie discards fractional part)

-   FRAC(expression) Extracts fractional part of a floating point expression (ie discards integer part).

-   Q7(expression) Converts a fractional floating point expression to a form suitable for the <a href="avrassembler.wb_FMUL.html" class="xref" title="FMUL- Fractional Multiply Unsigned">FMUL</a> / <a href="avrassembler.wb_FMULS.html" class="xref" title="FMULS - Fractional Multiply Signed">FMULS</a> / <a href="avrassembler.wb_FMULSU.html" class="xref" title="FMULSU - Fractional Multiply Signed with Unsigned">FMULSU</a> instructions. (sign + 7-bit fraction)

-   Q15(expression) Converts a fractional floating point expression to a form suitable for the <a href="avrassembler.wb_FMUL.html" class="xref" title="FMUL- Fractional Multiply Unsigned">FMUL</a> / <a href="avrassembler.wb_FMULS.html" class="xref" title="FMULS - Fractional Multiply Signed">FMULS</a> / <a href="avrassembler.wb_FMULSU.html" class="xref" title="FMULSU - Fractional Multiply Signed with Unsigned">FMULSU</a> instructions. (sign +15-bit fraction)

-   ABS() Returns the absolute value of a constant expression.

-   DEFINED(symbol) Returns true if symbolis previously defined using .equ/.set/.def directives. Normally used in conjunction with .if directives (.if defined(foo)), but may be used in any context. It differs from other functions in that parentheses around its argument are not required, and that it only makes sense to use a single symbol as argument.

-   STRLEN(string) returns the length of a string c+onstant, in bytes.
