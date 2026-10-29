#!/usr/bin/env python3
"""Generate 32-entry unsigned 8-bit waveform tables for preview/export tools."""
import math
from pathlib import Path

N = 32
def clamp(x: float) -> int:
    return max(0, min(255, round(x)))

waves = {
    "Wave_Sine8": [clamp(127.5 + 127.5 * math.sin(2 * math.pi * i / N)) for i in range(N)],
    "Wave_Triangle8": [clamp(255 * (1 - abs(2 * i / N - 1))) for i in range(N)],
    "Wave_Saw8": [clamp(255 * i / (N - 1)) for i in range(N)],
    "Wave_Square8": [255 if i < N // 2 else 0 for i in range(N)],
}
lines = ['; Generated waveform tables', '.segment "RODATA"']
for name, values in waves.items():
    lines.append(name + ":")
    for start in range(0, N, 8):
        lines.append(".byte " + ", ".join(f"${v:02X}" for v in values[start:start + 8]))
Path("generated_wave_tables.s").write_text("\n".join(lines) + "\n", encoding="utf-8")
print("Wrote generated_wave_tables.s")