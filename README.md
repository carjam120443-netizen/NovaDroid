# NovaDroid

A custom Android-based operating system project focused first on booting Android on x86_64 PCs and virtual machines.

## Project information

- Version: 0.1.0
- Foundation: AOSP and the Android-Generic PC build ecosystem
- Initial target: x86_64 PC / VirtualBox ISO
- Interface: Stock Android-inspired, with NovaDroid branding
- Status: Early development; ISO build pipeline not yet integrated or tested

## PC edition

The first release target is a bootable x86_64 ISO for testing in VirtualBox. The project will use an Android-for-PC source/build base rather than assuming a standard ARM phone product can produce a PC ISO. See [`docs/PC-ISO.md`](docs/PC-ISO.md) for the plan and current limitations.

## Existing ARM64 work

The `vendor/nova/` directory also contains an experimental AOSP Goldfish ARM64 emulator product scaffold. It is separate from the initial PC ISO target and is not currently a complete or tested build.

## Goals

- Produce a bootable x86_64 NovaDroid ISO
- Test boot and basic input/display support in VirtualBox
- Add NovaDroid branding, wallpapers, and startup animation
- Customize the launcher and selected system defaults
- Keep project-owned changes separate from upstream Android source
- Explore ARM64 and physical-device support as later projects

## Important status

No NovaDroid ISO has been built yet. This repository does not contain a complete Android source checkout, compiled system image, or installer. A successful build and VirtualBox boot test are required before calling an ISO usable.

## Disclaimer

NovaDroid is an independent project and is not affiliated with Google. Android is a trademark of Google LLC.