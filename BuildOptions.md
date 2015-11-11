## Introduction ##

RELIC is a meta-toolkit with strong emphasis in customization. This document details most of the build options available in the 0.3.0 release.



## Customization ##

Build options can be changed by using the CMake building system. CMake provides two ways of customizing options: using the `ccmake` interactive utility or by calling the `cmake` command with `-D` directives. For example, to assign a fictional switch `SWITCH` using the command-line tool, run:

```
cmake -DSWITCH=on path_to_target
```

## Available build options ##

In this section, we present all the build options grouped by purpose. For each build option, we specify its type and the possible values it may assume.

### Miscellaneous switches ###

These options are boolean switches useful to turn `ON`/`OFF` features in the whole library.

#### DEBUG ####

Value: `ON`/`OFF`

Changes the compiler flags in order to add debug information and disable optimization.


#### PROFL ####

Value: `ON`/`OFF`

Changes the compiler flags in order to support profiling.


#### CHECK ####

Value: `ON`/`OFF`

Adds support for error handling with TRY/CATCH macros (uses setjmp and longjmp).


#### VERBS ####

Value: `ON`/`OFF`

Be more verbose when printing error messages.


#### TRACE ####

Value: `ON`/`OFF`

Add tracing support.


#### MULTI ####

Value: `ON`/`OFF`

Add multithreading support.


#### DOCUM ####

Value: `ON`/`OFF`

Build documentation using Oxygen.


#### STRIP ####

Value: `ON`/`OFF`

Only compile the methods being used. For example, if you use Comba multiplication, the basic multiplication will not be compiled.
This also reduces code size in some cases. Enabling this flag can cause build errors in some configurations.
Enabling this flag does not guarantee that only functions being used will be compiled; if you wish to strip all uncalled functions, search how to use the -gc-sections flag in GCC.


#### QUIET ####

Value: `ON`/`OFF`

Disable all printing from the library.


#### BIGED ####

Value: `ON`/`OFF`

Enable if your platform is big endian.


#### SHLIB ####

Value: `ON`/`OFF`

Build RELIC as a shared library (e.g. librelic.so)


#### STLIB ####

Value: `ON`/`OFF`

Build RELIC as a static library (e.g librelic\_s.a)


#### STBIN ####

Value: `ON`/`OFF`

Link libraries statically when compiling test and benchmark programs.


#### WITH ####

Value: String with list of modules, or `"ALL"`

Several modules can also be entirely disabled by specifying a list of modules using the `WITH` variable. This variable receives a semicolon-separated list of modules. For example, `"BN;DV;MD;CP"`

Available modules:
  * `BN`:       Multiple precision arithmetic.
  * `DV`:       Temporary double-precision digit vectors.
  * `FP`:       Prime field arithmetic.
  * `FB`:       Binary field arithmetic.
  * `EP`:       Elliptic curves over prime fields.
  * `EB`:       Elliptic curves over binary fields.
  * `EC`:       Elliptic curve cryptography.
  * `PB`:       Pairings over binary elliptic curves.
  * `PP`:       Pairings over prime elliptic curves.
  * `PC`:       Pairing-based cryptography.
  * `BC`:       Block ciphers (symmetric encryption).
  * `MD`:       Message digests (hash functions).
  * `CP`:       Cryptographic protocols.
  * `ALL`:      All of the above.

Note: the programmer is responsible for not using unselected modules.

### Compiler options ###

#### COMP ####

Value: string

Flags passed to the compiler. Additional flags may be added by the configuration.


#### LINK ####

Value: string

Flags passed to the linker. Additional flags may be added by the configuration.


### Tests and benchmarks ###

These options specify the number of times a test of benchmark is ran. You can disable the building of tests and/or benchmarks by assigning a `0` value to these variables.

#### TESTS ####

Value: integer n >= 0

Number of iterations in each test.


#### BENCH ####

Value: integer n >= 0

Each benchmark will be iterated n<sup>2</sup> times.


### Architecture-specific options ###

Several platform characteristics can be customized with these options.


#### CORES ####

Value: integer n > 0

If your target platform is a multi-core processor and your compiler supports [OpenMP](http://www.openmp.org), `CORES` can be used to run some algorithms in parallel. To this date, this feature is only used by the implementations of cryptographic pairings.


#### ARCH ####

Value: `AVR` | `MSP` | `ARM` | `X86` | `X86_64`

RELIC supports several different architectures. The variable `ARCH` receives a string assignment specifying the target architecture, so any specification must be enclosed by quotes. When the library is cross-compiled, be sure to specify the target platform using this variable.

This variable is used in order to use some platform-dependent functions, such as timers. You may leave empty, but some functionalities may not work.


#### WORD ####

Value: `8` | `16` | `32` | `64`

The size in bits of a full digit can be changed by using the `WORD` size variable. `WORD` should refer to the maximum native unsigned integer type supported in your platform.

Changing the WORD size is crucial for solving this common compilation problem reported by users:

<pre>
[  0%] Building C object src/CMakeFiles/relic.dir/relic_core.c.o<br>
/home/*/relic-version/include/relic_types.h:113: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘dbl_t’<br>
</pre>

### Memory allocation and layout ###

#### ALIGN ####

Value: `1` | `2` | `8` | `16`

The `ALIGN` option controls the alignment (in bytes) of digit vectors in the memory layout. It is very useful for specifying custom alignments required by vector instructions sets such as SSE and wMMX.
When set to 1, alignment is disabled.


#### ALLOC ####

Value: `AUTO` | `STATIC` | `DYNAMIC` | `STACK`

Memory can be allocated in a total of four different ways, described below.
  * `AUTO`: uses automatic allocation from the stack
  * `STATIC`: tries to allocate all memory from a global pool and to restrict memory consumption
  * `DYNAMIC`: allocates memory from the heap using `malloc()` and allows multiple-precision integers to grow arbitrarily.
  * `STACK`: uses the `alloca()` function and is also stack-based.


### Arithmetic backends ###

#### ARITH ####

Value: `easy` | `gmp` (or any existing directory inside `relic-version/src/low`)

RELIC provides a complete framework for customizing arithmetic to a target platform. The `ARITH` variable points to the name of the directory inside the `relic-version/src/low` containing the implementation. By default, only two arithmetic backends are provided:
  * `easy`: easy-to-learn C-only backend
  * `gmp`: faster backend based on [GMP](http://gmplib.org).


### Pseudo-random number generation ###

#### RAND ####

Value: `FIPS`

The chosen PRNG. For now, only the FIPS 186-2 SHA1-based generator is supported.


#### SEED ####

Value: `DEV` | `LIBC` | `ZERO`

The variable `SEED` can be used to select the source of the initial PRNG seed.
  * `DEV`: uses /dev/random. Only works on Unix and may block indefinitely waiting for entropy
  * `UDEV`: uses /dev/urandom. Will not block. May not be adequate for highly sensitive applications
  * `WCGR`: uses Windows' CryptGenRandom
  * `LIBC`: uses the libc `rand()`/`random()` function (deterministic; not crypto safe! Should only be used for debugging purposes)
  * `ZERO`: uses a fixed zero seed (deterministic; not crypto safe! Should only be used for debugging purposes)


### Operating system-specific options ###

#### OPSYS ####

Value: `NONE` | `OPSYS` | `FREEBSD` | `MACOSX`

RELIC supports Linux, FreeBSD and Mac OS X via the `OPSYS` variable. If the target platform does not have an operating system (this is the case when using bare-metal toolchains), use the `NONE` value.
  * `NONE`: Undefined/No operating system.
  * `OPSYS`: GNU/Linux operating system.
  * `FREEBSD`: FreeBSD operating system.
  * `MACOSX`: Mac OS X.


#### TIMER ####

Value: `NONE` | `HREAL` | `HPROC` | `HTHRD` | `ANSI` | `POSIX` | `CYCLE`

If your platform has an operating system, you can choose the benchmark timer through the `TIMER` option. You should choose the highest-resolution timer available in your platform.
  * `NONE`:     No timer.
  * `HREAL`:    GNU/Linux realtime high-resolution timer.
  * `HPROC`:    GNU/Linux per-process high-resolution timer.
  * `HTHRD`:    GNU/Linux per-thread high-resolution timer.
  * `ANSI`:     ANSI-compatible timer.
  * `POSIX`:    POSIX-compatible timer.
  * `CYCLE`:    Cycle-counting timer. (architecture-dependant)