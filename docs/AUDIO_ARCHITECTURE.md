# Audio architecture

## NES runtime
The original NES has five native APU channels: two pulse channels, triangle, noise, and DMC. Keep runtime routines concise and avoid long tasks in NMI.

## Modern mixer
A desktop engine can implement 64 logical voices, each with oscillator/sample source, pitch, envelope, gain, pan, and effects. The mixer can accumulate in 64-bit floating point and convert to an output format. Voice count, numerical precision, CPU architecture, and sample bit depth are distinct.

## Wave tables
`src/wave_tables.s` contains 8-bit lookup tables for software previews/export. Original NES pulse/triangle channels do not accept arbitrary wavetable values. DMC playback has a specialized format and constraints.

## Future modules
Desktop mixer/output backend, graphical tracker/editor, instrument definitions, pattern sequencer, SFX event parser, NES song exporter, automated tests, and emulator regression tests.