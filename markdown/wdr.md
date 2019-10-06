AVR Assembler Instructions
==========================

WDR - Watchdog Reset
--------------------

### <a href="" id="N1A5F0"></a> Description:

This instruction resets the Watchdog Timer. This instruction must be executed within a limited time given by the WD prescaler. See the Watchdog Timer hardware specification.

Operation:

(i)WD timer restart.

Syntax: Operands: Program Counter:

(i)WDR None PC ← PC + 1

16-bit Opcode:

```
|      |      |      |      |
|------|------|------|------|
| 1001 | 0101 | 1010 | 1000 |
```
### <a href="" id="N1A623"></a> Status Register and Boolean Formula:

```
| I   | T   | H   | S   | V   | N   | Z   | C   |
|-----|-----|-----|-----|-----|-----|-----|-----|
| -   | -   | -   | -   | -   | -   | -   | -   |
```
Example:

``` programlisting
wdr ; Reset watchdog timer
```

Words: 1 (2 bytes)

Cycles: 1
