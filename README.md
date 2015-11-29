This repository contains example Rust code for nRF51822 using the zinc crate, a
bare metal stack for Rust.

This project is still work in progress. It also depends on [my zinc
fork](https://github.com/lizardo/zinc), which contains basic support for
nRF51822.

This code is being developed for a nRF51822-EK (Evaluation Kit) board, rev.
PCA10001, which contains a nRF51822 "QFAA CA" variant. It may work on other
variants with some customizations.

## Dependencies

This project depends on:

* [Rust nightly](https://www.rust-lang.org/downloads.html). It was specifically
  tested on 1.5.0-nightly (81b3b27cf 2015-10-11).
* [GCC ARM Embedded](https://launchpad.net/gcc-arm-embedded/+download) for
  linking and ELF to BIN conversion. Tested with 4.9-2015q3.
* [J-Link](https://www.segger.com/jlink-software.html) for flashing. Tested
  with version 5.10.
* zinc crate (a submodule of this repository).

*NOTE:* Currently, zinc compilation is failing with latest Rust nightly builds.

The zinc submodule may require initialization after `git clone`:

```
$ git submodule update --init zinc
```

## Usage

Erase flash (if necessary):

```
$ make erase-all
```

Build and flash a single example:

```
$ make APP=blink flash
```

To build all examples:

```
$ make
```

There are some variables on the Makefile that may need customization.

## License

The code is distributed under MIT license, see LICENSE-MIT for details.
