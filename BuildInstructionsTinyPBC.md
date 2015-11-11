## Introduction ##

TinyPBC can use RELIC as its cryptographic implementation. Support was introduced in RELIC version 0.1.1. In the rest of this document, we assume that TinyOS is already installed and compatible NesC/avr-gcc toolchains are available.

RELIC requires the CMake build system as its own dependency.

## Compilation ##

First of all, extract the RELIC release archive:

```
tar xzvf relic-version.tar.gz
```

Now create a target directory:

```
mkdir -p relic-tinypbc/
```

The easiest option is to load a configuration preset into this directory:

```
cd relic-tinypbc
../relic-version/preset/tinypbc-avr.sh ../relic-version/
make
```

A suitable static library will be ready in relic-targets/target-tinypbc/lib. To build TinyPBC, first extract the archive:

```
tar xzvf TinyPBC.tar.gz
```

To build a MICAz-compatible TinyOS image, run:
```
cd TinyPBC
make micaz
```

## Simulation ##

To build a TOSSIM-compatible image, you should repeat the steps above only replacing the preset:

```
cd relic-tinypbc
../relic-version/preset/tinypbc-avr-sim.sh ../relic-version/
make
```

A TinyPBC image compatible with TOSSIM must also be built:
```
cd TinyPBC
make -f Makefile-tossim micaz sim
```

The TinyOS build system does not easily support an external library. For this reason, export the full path to RELIC shared library with the LD\_PRELOAD environment variable:

```
export LD_PRELOAD=path/relic-tinypbc/lib/librelic.so
```

Now the simulation can be run as:
```
python simulate.py
```

The simulation runs two mote instances which independently compute a shared key. The output thus must show two identical shared keys.

## Notes and limitations ##

Some directories are hard-coded into TinyPBC Makefiles. Change them to your needs.

In real deployments, the private keys of the nodes must be precomputed and loaded into each node. In this implementation, each node receives a dummy master key and generates its own private key. **This is clearly not secure and is implemented in this way only for illustration purposes**.