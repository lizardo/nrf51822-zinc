CARGO = cargo
OBJCOPY = arm-none-eabi-objcopy
TARGET = thumbv6m-none-eabi
BUILD = release
APP = blink
ELF = target/$(TARGET)/$(BUILD)/$(APP)
BIN = $(ELF).bin

JLINK_OPTIONS = -device nrf51822 -if swd -speed 1000
JLINK = JLinkExe

all:
	$(CARGO) build --target=$(TARGET) --features mcu_nrf51822 --verbose --$(BUILD)

$(ELF):
	$(CARGO) build --target=$(TARGET) --features mcu_nrf51822 --verbose --$(BUILD) --bin $(APP)

clean:
	$(CARGO) clean

%.bin: %
	$(OBJCOPY) -Obinary $< $@

# "Flash" process:
# 1) set NVMC.CONFIG to 1 (Write enabled)
# 2) write firmware at address 0
# 3) set NVMC.CONFIG to 0 (Read only access)

flash: $(BIN)
	echo \
	connect\\n\
	w4 4001e504 1\\n\
	loadbin $< 0\\n\
	w4 4001e504 0\\n\
	r\\n\
	g\\n\
	exit | $(JLINK) $(JLINK_OPTIONS)

# "Erase all" process:
# 1) set NVMC.CONFIG to 2 (Erase enabled)
# 2) set NVMC.ERASEALL to 1 (Start chip erase)
# 3) wait some time for erase to finish
# 4) set NVMC.CONFIG to 0 (Read only access)

erase-all:
	echo \
	connect\\n\
	w4 4001e504 2\\n\
	w4 4001e50c 1\\n\
	sleep 100\\n\
	w4 4001e504 0\\n\
	r\\n\
	exit | $(JLINK) $(JLINK_OPTIONS)

.PHONY: all clean flash erase-all
