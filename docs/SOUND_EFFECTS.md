# Sound effects data

Example event streams are in `src/sfx_data.s`.

Proposed record format:
- byte 0: channel ID (`$02` pulse 2, `$03` noise)
- byte 1: timer low byte or noise period
- byte 2: duration in video frames
- `$FF`: end marker

A complete event-stream interpreter is future work; this file documents the planned data format.