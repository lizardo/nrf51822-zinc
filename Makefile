# Version currently required to build zinc:
# rustc 1.5.0-nightly (81b3b27cf 2015-10-11)
CARGO = multirust run nightly-2015-10-12 cargo

all:
	$(CARGO) build --target=thumbv6m-none-eabi --features mcu_nrf51822 --verbose --release

clean:
	$(CARGO) clean
