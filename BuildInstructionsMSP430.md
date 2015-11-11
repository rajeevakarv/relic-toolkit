## Introduction ##

The build process requires the [CMake](http://www.cmake.org/) cross-platform build system and the [MSPGCC](http://mspgcc.sourceforge.net/) compiler (see instructions for IAR below).

## Compilation ##

In the steps below, replace _version_ by the release version.

First of all, extract the RELIC release archive:

```
tar xzvf relic-version.tar.gz
```

This should create a directory named `relic-version`. Create a target directory:

```
mkdir -p relic-target
```

Run cmake inside the target directory, using one of the MSP430 presets (check the preset directory for available presets):

```
cd relic-target
../relic-version/preset/msp-pbc-80.sh ../relic-version
```

The preset will search for the "msp430-gcc" compiler in your PATH. If the compiler is not in your PATH, change it or edit the preset. By default, the target chip is msp430f1611, edit the preset if you want another.

Compile the library:

```
make
```

By default, the static library will be built in the `lib` directory. Tests and benchmarks should be present in `bin`. Some tests and benchmarks may fail to build since they are too large; you can comment out some tests and bechmarks.

## Execution ##

In order to run the programs, you can use your development board or a simulator. By default, RELIC adds print and benchmarking support for a custom version of the MSPsim simulator. [Download](http://conradoplg.cryptoland.net/software/custom-mspsim/) and extract it, then configure RELIC to use it:

```
cmake -DSIMP:STRING=java "-DSIMA:STRING=-jar;/path/to/mspsim.jar;-nogui" .
```

You can run the automated tests by running by using CTest:

```
ctest -R test -V
```

## Platform specific code ##

MSPGCC requires a putchar function provided by the user in order to print things. RELIC has a putchar implementation which interfaces with the custom MSPsim simulator above. If you have your own printing mechanism (e.g. UART), then edit src/arch/relic\_arch\_msp.c to remove the RELIC putchar.

## IAR Embedded Workbench ##

It is possible to use the IAR compiler by creating a project and adding all the .c files. There may be some issues with variable-length arrays. Define the MSP430X symbol in the assembler to add support for MSP430X, and define MSP430X2 to add support for the 32-bit multiplier.

In order to produce a valid backend for IAR, copy the relic-version/src/low/msp-asm folder to relic-version/src/low/msp-asm-iar/ . Extract [these scripts](http://dl.dropbox.com/u/47477/convert_iar.zip) to the msp-asm-iar folder, and execute convert.py (you will need Python installed). This will convert the GCC asm code from msp-asm into IAR asm code in msp-asm-iar. In the IAR project, add all the msp-asm/`*`.c files and all the msp-asm-iar/`*``_`asm.s files.