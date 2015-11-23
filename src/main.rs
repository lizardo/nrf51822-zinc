#![feature(plugin, no_std, asm)]
#![no_std]
#![plugin(macro_zinc)]

extern crate zinc;

use zinc::hal::mem_init::{init_data, init_stack};
use zinc::hal::nrf51822::power;

#[zinc_main]
fn run() {
    power::ram_power_on();
    init_data();
    init_stack();
    unsafe { asm!("nop") }
}
