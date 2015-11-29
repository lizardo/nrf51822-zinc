#![feature(plugin, no_std, asm)]
#![no_std]
#![plugin(macro_zinc)]

extern crate zinc;

use zinc::hal::mem_init::{init_data, init_stack};
use zinc::hal::nrf51822::{power,gpio};

const LED_0: usize = 18;
const LED_1: usize = 19;

// For a 16 MHz CPU, 1us == 16 instructions (assuming each instruction takes one cycle).
#[inline(always)]
fn delay_us(duration: u32) {
    let mut duration = duration;
    // The inner loop instructions are: 14 NOPs + 1 SUBS/ADDS + 1 CMP
    while duration != 0 {
        unsafe {
            asm!("
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop" :::: "volatile");
        }
        duration -= 1;
    }
}

fn delay_ms(duration: u32) {
    let mut duration = duration;
    // Note that this is not precise as there are 2 extra instructions on the inner loop.
    // Therefore, there is 1us added every 8 iterations.
    while duration != 0 {
        delay_us(1000);
        duration -= 1;
    }
}

#[zinc_main]
fn run() {
    power::ram_power_on();
    init_data();
    init_stack();

    gpio::configure_output(LED_0);
    gpio::configure_output(LED_1);

    loop {
        gpio::pin_clear(LED_0);
        gpio::pin_set(LED_1);

        delay_ms(500);

        gpio::pin_clear(LED_1);
        gpio::pin_set(LED_0);

        delay_ms(500);
    }
}
