# BlindSigner

BlindSigner is an accessibility-first fork of SeedSigner v0.8.0

It is designed as an **audio-first, linearly navigable Bitcoin signing device**
for **blind, visually impaired, and illiterate users**.

BlindSigner prioritizes usability for non-visual interaction over visual
efficiency for sighted users.

⚠️ BlindSigner is **not** a replacement for SeedSigner.  
It is a parallel, specialized project with a different primary user group.

---

## Motivation

There is currently no self-custody Bitcoin signing device that blind users
can operate independently and securely.

BlindSigner aims to enable **true self-custody without assistance**, using:
- offline operation
- minimal input controls
- spoken feedback instead of visual orientation

The goal is a **Sound Money device that does not require sight**.

---

## Design Principles

- **Audio-first**
  - Spoken screen names
  - Spoken focus changes
  - No reliance on spatial or grid-based layouts

- **Linear navigation**
  - List-based menus only
  - No 2×2 tile UI
  - Predictable focus order

- **Minimal inputs**
  - UP / DOWN / CONFIRM
  - Joystick only where unavoidable (e.g. text entry)

- **Offline only**
  - No cloud services
  - Offline text-to-speech (TTS)

- **Security first**
  - Seeds are never stored persistently
  - RAM-only seed handling
  - Power-off clears all sensitive data

---

## Technical Base

BlindSigner is based on **SeedSigner v0.4.6**, chosen because:

- It is the last version using the classic list-based MenuView UI
- Later versions switched to a tile-based GUI unsuitable for non-visual use
- The codebase is simpler and more approachable for step-by-step development

BlindSigner intentionally stays close to this version to maximize stability
and auditability.

---

## Hardware

- Raspberry Pi Zero W
- Camera module
- Physical buttons (UP / DOWN / CONFIRM)
- Optional joystick (limited use)

Tested with the official SeedSigner 0.4.6 image.

---

## Current Status

This project is in **early development**.

Current focus:
- Stability improvements
- Robust operation without SD card
- Understanding and fixing QR scan crashes
- Preparing the codebase for audio-first interaction

Accessibility features (TTS, spoken navigation) will be introduced
incrementally after a stable base is achieved.

---

## Non-Goals

BlindSigner explicitly does **not** aim to:
- Replace SeedSigner
- Maintain feature parity with newer SeedSigner versions
- Optimize for visual UI efficiency

Trade-offs are made deliberately in favor of accessibility.

---

## Relationship to SeedSigner

BlindSigner is a fork of SeedSigner v0.4.6.

- The original SeedSigner project is respected and credited
- Changes made here are specific to accessibility requirements
- This repository does not represent the SeedSigner project

If you are a sighted user looking for the mainstream SeedSigner experience,
please use the official SeedSigner repository.

---

## Disclaimer

This project is experimental.

Use at your own risk.  
No warranty is provided.

Always verify the code and understand the security model before using any
Bitcoin signing device.

---

## License

BlindSigner inherits the license of SeedSigner.
See the LICENSE file for details.
