AVR Assembler AVR Assembler Command Line Options
================================================

AVRASM2 may be used as a stand-alone program from the command line. The AVRASM2 command-line invocation syntax is shown below.

``` programlisting
usage: avrasm2.exe [options] file.asm

       Options: 
-f [O|M|I|G|-] output file format: 
-fO Debug info for simulation in Atmel Studio (default) 
-fO1 | -fO2 - force format version 1 or 2 (default: auto) 
-fM Motorola hex -fI Intel hex -fG Generic hex format 
-f- No output file -o ofile Put output in 'ofile'. 
-d dfile Generate debug info for simulation in Atmel Studio in 'dfile'. Can only be used with the -f [M|I|G] option. 
-l lfile Generate listing in 'lfile' 
-m mfile Generate map in 'mfile' 
-e efile Place EEPROM contents in 'efile' 
-w Relative jumps are allowed to wrap for program ROM up to 4k words in size [ignored] 
-C ver Specify AVR core version 
-c Case sensitive 
-1/-2 Turn on/off AVR Assembler version 1 compatibility. [Deprecated] 
-p1|0 Set/unset AVRASM1 implicit .device include (also set by -1) [Deprecated]
-I dir Preprocessor: Add 'dir' to include search path 
-i file Preprocessor: Explicitly pre-include file 
-D name[=value] Preprocessor: Define symbol. If =value is omitted, it is set to 1. 
-U name Preprocessor: Undefine symbol. 
-S file Produce include/label info file for Atmel Studio 
-v verbosity [0-9][s]: 
-vs Include target resource usage statistics 
-vl Output low-level assembly code to stdout 
-v0 Silent, only error messages printed 
-v1 Error and warning messages printed 
-v2 Error, warning, and info messages printed (default) 
-v3-v9 Unspecified, increasing amounts of assembler internal dumps. 
-V  Format map and list files for Verilog.
-O i|w|e Overlap report: ignore|warning|error [error] 
-W-b|+bo|+bi Byte operand out of range warning disable|overflow|integer 
-W+ie|+iw Unsupported instruction error | warning 
-W+fw  Label slip caused by forward ref accepted (DANGEROUS)
-FD|Tfmt __DATE__ | __TIME__ format, using strftime(3) format string
        
```

-f output-file-format
---------------------

Supported formats are generic/Intel/Motorola hex, and AVR Object files. There are two subvariants of the AVR Object file format:

-   Standard (V1) format, with 16-bit line number fields, supporting source files with up to 65534 lines.

-   Extended (V2) format, with 24-bit line number fields, supporting source files with up to ~16M lines.

By default, when output format is unspecified or specified with -fO, the assembler will select the appropriate format automatically, V1 if the file has less than 65533 lines, V2 if it has more. The -fO1 and -fO2 options may be used to force V1 or V2 output file format regardless of number of lines.

If V1 file format is used with source files with more than 65534 lines, the assembler will issue a warning, and the lines above 65534 cannot be debugged with Atmel Studio.

For all normal assembler projects, the default option should be safe. The extended format is primarily intended for machine-generated assembly files.

-w
--

Wrap relative jumps. This option is obsoleted, because AVRASM2 automatically determines when to wrap relative jumps, based on program memory size. The option is recognized but ignored.

-C core-version
---------------

Specify AVR Core version. The core version is normally specified in part definition files (partdef.inc), this option is intended for testing of the assembler, and generally not useful for end-users.

-c
--

Causes the assembler to become entirely case sensitive. Preprocessor directives and macros are always case sensitive. Warning: Setting this option will break many existing projects.

-1 -2 \[Deprecated\]
--------------------

Enable and disable AVRASM1 compatibility mode. This mode is disabled (-2) by default. The compatibility mode will permit certain constructs otherwise considered errors, reducing the risk of breaking existing projects. It also affects the built-in include path, causing the assembler to look for device definition include files (devicedef.inc) for Assembler 1 in `       C:\Atmel\AVR Tools\AvrAssembler\Appnotes      ` instead of the new Assembler 2 files in `       C:\Atmel\AVR Tools\AvrAssembler2\Appnotes      ` . <span class="emphasis"> *Note: -1 option is deprecated and will not work in Atmel Studio 6 because the AVRASM1 include files are no longer distributed.* </span>

-I directory
------------

Add directory to the include file search path. This affects both the preprocessor <a href="avrassembler.wb_preprocessor.include.html" class="xref" title="#include">the section called “#include”</a> directive and the assembler <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.INCLUDE" class="xref" title="INCLUDE - Include another file">INCLUDE</a> directive.

Multiple -I directives may be given. directories are searched in the order specified.

-i file
-------

Include a file. \#include file directive is processed before the first source code line is processed. Multiple i directives may be used and will be processed in order.

-D name\[=value\] -U name
-------------------------

Define and undefine a preprocessor macro, respectively. Note that function-type preprocessor macros may not be defined from the command line. If -D is given no value, it is set to 1.

-S
--

Produces information about the include files, ouput files and label information Contained in the source file.

-vs
---

Print use statistics for register, instruction and memory on standard output. By default, only the memory statistic is printed. Note: The full statistics will always be printed to the list file, if one is specified.

-vl
---

This will print the raw instructions emitted to standard output, after all symbolic info is replaced. Mainly for assembler debugging purposes.

-v0
---

Print error messages only, warning and info messages are suppressed.

-v1
---

Print error and warning messages only, info messages are suppressed.

-v2
---

Print error, warning, and info messages. This is the default behaviour.

-v3 … -v9
---------

Print increasing amounts of assembler internal status dump. Mostly used for assembler debugging.

-V
--

Formats the List and Map File for Verilog.It sets the Verilog Option.

```
-O i|w|e
--------
```
If different sections of code are mapped to overlapping memory locations using the <a href="avrassembler.wb_directives.html#avrassembler.wb_directives.ORG" class="xref" title="ORG - Set program origin">ORG</a> directive, an error message is normally issued.

This option allows setting this condition to cause an error (-Oe, default), a warning (-Ow) or be completely ignored (-Oi). Not recommended for normal programs.

This may also be set by \#pragma overlap directive.

```
-W-b |-W+bo | -W+bi
-------------------
```
-b, +bo, and +bi correspond to no no warning, warning when overflow, and warning when integer value out of range, respectively. This may also be set by \#pragma warning range.

```
-W+ie|+iw
---------
```
+ie and +iw selects if use of unsupported instructions gives error or warning, respectively. The default is to give an error. Corresponds to \#pragma error instruction / pragma warning instruction, respectively.

-FDformat -FTformat
-------------------

Specify the format of the \_\_DATE\_\_ and \_\_TIME\_\_ <a href="avrassembler.wb_preprocessor.Pre-defined_macros.html" class="xref" title="Pre-defined macros">the section called “Pre-defined macros”</a> , respectively. The format string is passed directly to the strftime(3) C library function. The \_\_DATE\_\_ and \_\_TIME\_\_ preprocessor macros will always be string tokens, i.e., their values will appear in double quotes.

The default formats are “%b %d %Y” and “%H:%M:%S”, respectively.

Example: To specify ISO format for \_\_DATE\_\_, specify <span class="command"> **-FD“%Y-%m-%d”** </span>

These formats may only be specified at the command line, there are no corresponding \#pragma directives.

### Note

The Windows command interpreter (cmd.exe or command.com) may interpret a character sequence starting and ending with a ‘%’ character as an environment variable to be expanded even when it is quoted. This may cause the date/time format strings to be changed by the command interpreter and not work as expected. A workaround that will work in many cases is to use double ‘%’ characters to specify the format directives, e.g., <span class="command"> **-FD“%%Y-%%m-%%d”** </span> for the example above. The exact behaviour of the command interpreter seems to be inconsistent and vary depending on a number of circumstances, for one, it is different in batch and interactive mode. The effect of the format directives should be tested. It is recommended to put the following line in the source file for testing this:

``` programlisting
#message "__DATE__ =" __DATE__ "__TIME__ =" __TIME__
```

t This will print the value of the date and time macros when the program is assembled, making verification easy (see <a href="avrassembler.wb_preprocessor.error.html" class="xref" title="#error, #warning and #message">the section called “#error, #warning and #message”</a> directive documentation). An alternative syntax for the format specification may be considered in future AVRASM2 versions to avoid this problem.

Some relevant strftime() format specifiers (see strftime(3) manual page for full details):

-   %Y - Year, 4 digits

-   %y - Year, 2 digits

-   %m - Month number (01-12)

-   %b - Abbreviated month name

-   %B - Full month name

-   %d - Day number in month (01-31)

-   %a - Abbreviated weekday name

-   %A - Full weekday name

-   %H - Hour, 24-hour clock (00-23)

-   %I - Hour, 12-hour clock (01-12)

-   %p - “AM” or “PM” for 12-hour clock

-   %M - Minute (00-59)

-   %S - Second (00-59)
