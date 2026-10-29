# Build and test checklist

1. Install cc65.
2. Set up a valid NES linker configuration and segment layout.
3. Assemble each module and ensure there are no duplicate zero-page allocations or segment conflicts.
4. Link a minimal NROM test ROM.
5. Run in Mesen or FCEUX and inspect APU register writes.
6. Verify pitch and timing against timer calculations.
7. Test NTSC and PAL separately before claiming cross-region support.

The initial tree contains modular examples which are not all integrated into one tested ROM.