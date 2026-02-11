# BlindSigner

BlindSigner is an accessibility-focused fork of SeedSigner.

Its goal is to make air-gapped Bitcoin signing hardware usable for blind and visually impaired users by adding audio feedback and screen reader functionality while preserving SeedSigner’s core security model.

---

## Vision

BlindSigner aims to provide:

- Full menu navigation with audio output  
- Multi-language spoken feedback  
- Accessible confirmation of critical actions  
- USB audio output support  
- Compatibility with Raspberry Pi Zero hardware  
- Maximum alignment with upstream SeedSigner for long-term maintainability  

This project builds upon the excellent work of the SeedSigner team and extends it with accessibility features.

---

## Project Status

Current base version: SeedSigner 0.8.6

Planned features:

- Integration of eSpeak-ng for text-to-speech  
- USB sound card support via micro USB OTG  
- Spoken startup and shutdown feedback  
- Spoken menu navigation  
- Spoken QR scanning results  
- Multi-language speech support  

BlindSigner is currently experimental and under active development.

---

## Architecture Overview

BlindSigner consists of two components:

1. BlindSigner Application (this repository)  
   A fork of SeedSigner that introduces accessibility modifications.

2. BlindSigner OS (based on seedsigner-os)  
   A custom Buildroot-based Linux image that:
   - Boots entirely from RAM  
   - Removes networking and wireless functionality  
   - Maintains minimal attack surface  
   - Adds audio subsystem support  
   - Integrates text-to-speech tools  

The OS produces a reproducible microSD card image.

---

## Hardware Target

- Raspberry Pi Zero or Zero W  
- Waveshare 1.3” LCD HAT (standard SeedSigner configuration)  
- USB sound card connected via micro USB OTG  
- Headphones or audio output device  

---

## Building BlindSigner OS

BlindSigner OS is built using the official SeedSigner OS build system, modified to use this repository as the application source.

From within the seedsigner-os directory, build using the appropriate branch of BlindSigner as the application source. The resulting image will be generated inside the images directory and can be flashed to a microSD card.

---

## Accessibility Goals

BlindSigner focuses on:

- Spoken startup confirmation  
- Spoken menu navigation  
- Spoken confirmations for sensitive operations  
- Clear audio feedback for user actions  
- Support for multiple languages using eSpeak-ng  

Accessibility enhancements must never reduce cryptographic security.

---

## Security Philosophy

BlindSigner preserves the core security principles of SeedSigner:

- Fully air-gapped operation  
- No networking or wireless connectivity  
- No Bluetooth  
- No persistent writable storage after boot  
- Minimal and auditable system footprint  

Security remains the highest priority.

---

## Contributing

Contributions are welcome.

Areas of interest include:

- Text-to-speech improvements  
- Language expansion  
- Audio user experience design  
- Accessibility testing  
- Documentation  

Please open issues or pull requests to contribute.

---

## Disclaimer

BlindSigner is experimental software.

Do not use with significant amounts of Bitcoin until the software has been thoroughly tested and independently reviewed.

You are responsible for verifying and understanding the code before use.

---

## Credits

BlindSigner is based on SeedSigner:  
https://github.com/SeedSigner/seedsigner

All credit for the original architecture, hardware concept, and security model belongs to the SeedSigner team.

BlindSigner extends their work with accessibility enhancements.
