# Audio Wave Systems Program

Starter project for NES 6502 audio programming, waveform reference tables, sound-effect data, and wavelength/audio FAQ documentation.

## Project status
This repository was empty when inspected. The initial source tree is being established from a starter project; builds and emulator behavior require local validation.

## Scope
- NES APU runtime examples
- 6502 assembly helpers and example music/SFX data
- 8-bit waveform lookup tables and a Python generator
- Wavelength, frequency, sampling, DSP, and audio architecture FAQ
- Distinction between original NES hardware and modern 64-voice/64-bit software audio

## Build
Install cc65 and run `make`. Set `NES_CFG` in the Makefile if `nes.cfg` is installed elsewhere.

Not all modular examples are linked into the ROM by default.