# NovaDroid architecture

NovaDroid is an Android-based operating system project. Its first deliverable is a bootable x86_64 PC ISO for virtual-machine testing.

## Initial PC edition

1. **Android platform** — Android framework, system services, and core platform components from an AOSP-derived Android-for-PC source tree.
2. **PC compatibility layer** — x86_64 device configuration, kernel, graphics stack, input support, and boot/ISO packaging supplied by the selected Android-for-PC ecosystem.
3. **NovaDroid layer** — project-owned branding, default configuration, overlays, startup assets, and carefully selected customizations.
4. **ISO and validation** — bootable image creation, VirtualBox testing, checksums, release notes, and known-issues documentation.

## Upstream selection

Android-Generic is being evaluated as the PC build/configuration ecosystem. Bliss OS is a related Android-for-PC project, but its public ISO releases are paused while its next source tree is developed. NovaDroid must pin a specific compatible source branch before build instructions or automation are treated as reproducible.

## Existing ARM64 scaffold

The `vendor/nova/` product files currently describe an experimental AOSP Goldfish ARM64 emulator target. That configuration is separate from the x86_64 PC ISO and has not been validated in a complete AOSP checkout.

## Design principles

- Keep the initial user experience close to stock Android.
- Keep NovaDroid-owned changes separate from upstream source.
- Prefer documented, reproducible build inputs.
- Do not claim VirtualBox or hardware compatibility until tested.
- Do not label an image installable or flashable for a device it was not built and tested for.

## Current limitations

This repository does not contain a complete Android source tree, kernel, compiled system image, or ISO. It is the project layer and documentation.