# NovaDroid

A custom Android operating system based on the Android Open Source Project (AOSP).

## Project information

- Version: 0.1.0
- Foundation: AOSP
- Interface: Stock Android
- Initial target: ARM64 Android emulator
- Status: Early development; product configuration scaffold added

## Current build target

The repository includes an initial AOSP product configuration under `vendor/nova/` for the generic Goldfish ARM64 emulator. See [`vendor/nova/README.md`](vendor/nova/README.md) for integration notes.

This is a source/configuration scaffold, not a complete Android source checkout or a ready-to-flash ROM. The first milestone is to integrate it into a matching AOSP tree, build the emulator target, and verify that it boots.

## Goals

- Build from AOSP
- Customize Android branding
- Develop custom system features
- Establish and test device support
- Eventually produce device-specific flashable ROMs

## Disclaimer

NovaDroid is an independent project and is not affiliated with Google. Android is a trademark of Google LLC.
