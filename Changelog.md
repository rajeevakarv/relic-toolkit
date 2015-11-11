## Release 0.3.5 ##
  * Fixed installation support.
  * Added partial const-correctness across the library.
  * Added support for simultaneous linking of multiple libraries.
  * Added support for pairings defined over supersingular prime curves.
  * Deprecated PB module and support to TinyPBC due to improved discrete log algorithms in small characteristic.
  * Removed support for hyperelliptic supersingular curves, due to the same reason.
  * As always, plenty of polishing and bug fixes.

## Release 0.3.4 ##
  * Added constant-time comparisons for verifying digital signatures.
  * Added support for Android and updated support for Windows.
  * Added explicit library context to make library thread-friendlier and support multiple configurations.
  * Added support for BLS12 at the 192-bit security level curve and updated formulas for line functions in pairing computation.
  * Added preliminary support for library fixes. Full support should come in next version (0.4.0).
  * Lots of bug fixes and polishing.

## Release 0.3.3 ##
  * Licensing change.
  * RSA is now able to sign a precomputed hash.

## Release 0.3.2 ##

  * Refactored code for pairings over binary and prime fields.
  * Faster GMP backend.
  * Released backends for TI MSP430 platform.

## Release 0.3.1 ##

  * Added a new backend for instantiating TinyPBC at the 80-bit security level on AVR sensors.
  * Added a new backend for primitive CURVE2251 on SSE-capable platforms and the corresponding preset.
  * Improved compatibility with Windows platforms.
  * Minor speedups in pairing code and new parameters at the 192-bit security level.
  * Square roots can now be computed when p = 1 mod 4.
  * Added pairings defined over supersingular genus-2 curves over binary fields.
  * Added ECMQV protocol.
  * Fixed MANY bugs and memory leaks.

## Release 0.3.0 ##

  * Faster pairings over BN curves using lazy reduction (more to come on 0.3.1!).
  * First bits of ternary field arithmetic and time-space trade-offs for computing fixed powers of binary fields.
  * Support for supersingular genus-2 curves over binary fields.
  * Elliptic curve Schnorr signatures and BLS and Boneh-Boyen short signature schemes.
  * Better standards-compliance and new padding schemes for RSA.
  * Fixed MANY bugs.

## Release 0.2.3 ##

  * Fixed a TinyPBC integration bug.

## Release 0.2.2 ##

  * Updated the TinyPBC AVR profile and released the arithmetic backend for fast binary field arithmetic and fast pairing computation on AVR devices.

## Release 0.2.1 ##

  * Added a new faster memory allocator called AUTO. It is now the default and will replace the STACK allocator in the next releases.
  * Several bugs fixed.

## Release 0.2.0 ##

  * Added support for prime fields and standard NIST curves over prime fields.
  * Added support for Barreto-Naehrig pairing-friendly curves and the R-ate pairing.
  * Added an abstraction layer so that protocols can be implemented over a generic pairing e : G\_1 x G\_2 -> G\_T.

## Release 0.1.2 ##

  * Fixed several OSX-only bugs.

## Release 0.1.1 ##

  * Included support for TinyPBC targets.

## Release 0.1.0 ##

  * Initial release supporting multi-precision arithmetic, binary fields, NIST binary curves and the nT pairing over supersingular curves.