This repository contains a sample project for nRF51822 using the zinc crate, a
bare metal stack for Rust.

This project is still work in progress. The initial code just initializes RAM.
It also depends on my zinc fork, which contains basic support for nRF51822.

## Build

This project depends on Rust nightly. It was specifically tested on
1.5.0-nightly (81b3b27cf 2015-10-11). Currently, latest nightly builds are
failing compilation for zinc.

To build:

```
$ git submodule update --init zinc
$ make
```

## Usage

TODO.

## License

The code is distributed under MIT license, see LICENSE-MIT for details.