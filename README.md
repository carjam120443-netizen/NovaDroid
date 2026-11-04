# NovaDroid

A custom Android-based operating system project focused first on x86_64 PC and virtual-machine development.

## Project information

- Version: 0.1.0
- Android baseline: Android 16
- Initial build architecture: x86_64
- Current automated target: AOSP Cuttlefish emulator images
- Intended PC target: bootable ISO for VirtualBox, pending a compatible Android 16 PC port
- Status: Android 16 baseline workflow scaffold added; build not yet run

## Android 16 build

The repository includes a manual GitHub Actions workflow and build script for an Android 16 x86_64 Cuttlefish baseline. See [`docs/ANDROID-16-BOOTSTRAP.md`](docs/ANDROID-16-BOOTSTRAP.md). It requires a suitably sized self-hosted Linux runner.

**Important:** Cuttlefish emulator images are not a PC-bootable ISO. A separate Android 16 PC kernel/device/boot integration is required before NovaDroid can produce the VirtualBox ISO we ultimately want.

## Existing ARM64 work

The `vendor/nova/` directory also contains an experimental AOSP Goldfish ARM64 emulator product scaffold. It is separate from the x86_64 Android 16 baseline.

## Goals

- Build and validate an Android 16 x86_64 baseline
- Integrate a compatible Android 16 PC boot stack
- Produce and test a bootable NovaDroid ISO in VirtualBox
- Add NovaDroid branding, wallpapers, and startup animation
- Customize launcher defaults and selected system settings
- Keep project-owned changes separate from upstream Android source

## Current status

No NovaDroid ISO has been built yet. The workflow is scaffolding for a baseline emulator build, not an ISO builder. The repository does not contain a complete Android source checkout or compiled release image.

## Disclaimer

NovaDroid is an independent project and is not affiliated with Google. Android is a trademark of Google LLC.