This repository contains example Rust code for nRF51822 using the zinc crate, a
bare metal stack for Rust.

This project is still work in progress. It also depends on my [zinc
fork](https://github.com/lizardo/zinc), which contains basic support for
nRF51822.

## Build

This project depends on Rust nightly. It was specifically tested on
1.5.0-nightly (81b3b27cf 2015-10-11). Currently, zinc compilation is failing
with latest nightly builds.

To build:

```
$ git submodule update --init zinc
$ make
```

## Usage

TODO.

## License

The code is distributed under MIT license, see LICENSE-MIT for details.
