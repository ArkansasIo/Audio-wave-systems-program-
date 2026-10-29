CA65 ?= ca65
LD65 ?= ld65
NES_CFG ?= /usr/share/cc65/cfg/nes.cfg
BUILD := build

all: $(BUILD)/audio-wave-systems.nes

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/header.o: src/header.s | $(BUILD)
	$(CA65) -o $@ $<

$(BUILD)/main.o: src/main.s | $(BUILD)
	$(CA65) -o $@ $<

$(BUILD)/audio-wave-systems.nes: $(BUILD)/header.o $(BUILD)/main.o
	$(LD65) -C $(NES_CFG) -o $@ $(BUILD)/header.o $(BUILD)/main.o

clean:
	rm -rf $(BUILD)

.PHONY: all clean
