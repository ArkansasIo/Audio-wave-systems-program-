# Wave Length Systems FAQ and Reference

## Fundamental terms
- **Wavelength (λ):** spatial distance between corresponding points of successive cycles of a traveling wave.
- **Frequency (f):** cycles per second, in hertz.
- **Period (T):** time per cycle, T = 1/f.
- **Propagation speed (v):** speed of a disturbance through a medium.
- **Amplitude:** magnitude relative to a reference level.
- **Phase:** position within a cycle.

Core formulas:
- Wavelength: λ = v/f
- Frequency: f = 1/T
- Samples per cycle: N = fs/f
- Nyquist frequency: fN = fs/2
- Uncompressed PCM data rate = sample rate × bits/sample × channels

Wavelength and frequency are inversely related for a fixed propagation speed. Samples-per-cycle is a separate digital-audio concept.

## Wave types
- **Mechanical:** require a medium, e.g. sound and seismic waves.
- **Electromagnetic:** can travel through a vacuum; radio, microwave, infrared, visible, ultraviolet, X-ray, gamma ray.
- **Transverse:** oscillation perpendicular to propagation.
- **Longitudinal:** oscillation parallel to propagation; sound in air is a common example.
- **Traveling:** propagates through space.
- **Standing:** stationary nodes and antinodes.
- **Periodic:** repeats at a fixed interval.
- **Aperiodic:** no fixed repeating period.

## Common waveforms
- **Sine:** smooth periodic signal with a single ideal frequency.
- **Square:** two-level waveform with odd harmonics in the ideal case.
- **Pulse:** rectangular waveform with adjustable duty cycle.
- **Triangle:** linear rise/fall with harmonics that decay faster than square-wave harmonics.
- **Sawtooth:** ramp followed by reset; rich in harmonics.
- **Noise:** stochastic signal. White noise is approximately flat in power spectral density over a defined bandwidth; pink noise is approximately equal energy per octave.
- **Wavetable:** stored samples representing one cycle or a segment of sound.

## Digital audio FAQ
### What is sample rate?
Samples generated or captured per second, e.g. 44.1 kHz or 48 kHz.
### What is bit depth?
Number of bits used to represent each sample. Greater depth generally permits greater dynamic range and lower quantization noise when correctly implemented.
### What is aliasing?
False frequency content caused by sampling without adequate bandwidth limitation. Anti-alias filtering is important when sampling or downsampling.
### What is PCM?
Pulse-code modulation: audio represented as numeric sample values.
### What does 64-bit audio mean?
It may mean 64-bit floating-point processing, a 64-bit CPU architecture, or 64 channels; these are different specifications.

## DSP and synthesis
- **Oscillator:** generates a waveform at a chosen pitch and phase.
- **Envelope:** changes a parameter over time; ADSR means attack, decay, sustain, release.
- **Filter:** shapes frequency content.
- **Modulation:** one signal changes a property of another; examples FM, AM, PWM.
- **LFO:** low-frequency oscillator used for modulation.
- **Fourier analysis:** represents a signal as sinusoidal components.
- **Mixer:** combines voices with gain, panning, effects, and headroom.
- **Limiter:** controls peaks before output conversion.

## NES APU FAQ
### How many native channels?
Five: Pulse 1, Pulse 2, Triangle, Noise, and DMC. See https://www.nesdev.org/wiki/NES_APU.
### Does the original NES support 64 independent hardware channels?
No. Software can multiplex voices, but CPU time and the five native APU channels constrain the result.
### Can arbitrary wave tables play directly through NES pulse channels?
No. Pulse and triangle are hardware waveform generators. DMC plays a limited one-bit delta-coded sample stream.
### Can 6502 software use 64-bit numbers?
It can implement multi-byte arithmetic, but these operations are expensive on an 8-bit CPU. This does not make the APU a 64-bit audio device.
### What does the pulse timer do?
It sets the pulse period. Approximate NTSC relationship: frequency ≈ CPU clock / (16 × (timer + 1)), subject to hardware timing details and timer limits.
### What does noise do?
The noise channel uses a pseudo-random shift-register sequence, useful for percussion and effects.
### What is DMC?
It fetches a one-bit delta stream and updates a 7-bit output counter; it is not general high-resolution PCM.

## Modern 64-voice audio architecture
A desktop engine can expose 64 logical voices with source, pitch, gain, envelope, pan, and effects. It may mix in 64-bit floating point, then convert to a selected output format. Voice count, numeric precision, CPU architecture, and sample bit depth are independent design dimensions.

Suggested modules: voice allocator, oscillators, ADSR envelopes, filters, delay/reverb/distortion/chorus, mixer, limiter, platform audio backend, and NES exporter that reduces compatible arrangements to Pulse 1, Pulse 2, Triangle, Noise, and DMC.

## Commonly confused terms
- Wavelength = distance per cycle.
- Period = time per cycle.
- Frequency = cycles per second.
- Amplitude = signal magnitude.
- Sample rate = samples per second.
- Bit depth = bits per sample.
- Bit rate = data bits per second.
- 64-bit processing = numeric precision or CPU architecture.
- 64-channel mixing = number of controlled voices/streams.

## References
- NESdev APU: https://www.nesdev.org/wiki/NES_APU
- NESdev APU basics: https://www.nesdev.org/wiki/APU_basics
- NESdev APU registers: https://www.nesdev.org/wiki/APU_registers
- NASA electromagnetic spectrum: https://science.nasa.gov/ems/01_intro/

## Status
This is reference documentation and proposed architecture; it does not claim a complete 64-voice mixer, full DSP suite, or NES exporter is implemented.