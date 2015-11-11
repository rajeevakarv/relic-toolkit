## Introduction ##

The build process requires the [CMake](http://www.cmake.org/) cross-platform build system. This should make RELIC available in all platforms supported by CMake.

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

Run cmake inside the target directory:

```
cd relic-target
cmake ../relic-version
```

CMake will detect a suitable C compiler and show all the customization options. For now, just compile the library:

```
make
cd ..
```

By default, static and shared libraries will be built in the `relic-target/lib` directory. Tests and benchmarks should be present in `relic-target/bin`. You can run the automated tests by running each binary independently or by using CTest:

```
cd relic-target
ctest
```

The customization options are described in BuildOptions. You can change these by running:

```
ccmake relic-target
```

If you are using one of the provided configuration presets, make sure it is applied to an empty target folder. Presets were not designed to provide full configurations or to fix bad ones, but only to override some of the defaults.

## Installation ##

Installation is not required but can be done with:

```
make install
```

By default, CMake installs binaries and headers into the `/usr/local/` prefix. You can change this by passing a `DESTDIR=` variable along with the `make install` command.

## Contact ##

In case of errors, please contact the developers through the discussion group.