# NovaDroid PC ISO plan

## Goal

Build a bootable x86_64 NovaDroid ISO that starts in VirtualBox on a Windows host. The first ISO milestone is a live/test image, not an installer that modifies a physical disk.

## Android 16 direction

NovaDroid now has an Android 16 x86_64 baseline workflow. It builds AOSP Cuttlefish emulator images, not a PC ISO. See [`ANDROID-16-BOOTSTRAP.md`](ANDROID-16-BOOTSTRAP.md).

## Why the ISO is a separate engineering task

The existing `vendor/nova/` product configuration inherits an ARM64 Goldfish emulator product. It cannot be used as an x86_64 PC ISO simply by changing the output filename. PC boot requires an x86_64 kernel, device configuration, graphics/input support, bootloader integration, and ISO packaging.

Android-Generic's published getting-started documentation describes PC builds for Android 10, 11, and 12 and notes that its older instructions apply to an archived version. It does not establish a verified Android 16 PC build path. We should not claim it supports Android 16 until that is demonstrated against a specific source revision.

## Build strategy

1. Build and validate the pinned Android 16 x86_64 Cuttlefish baseline.
2. Identify a maintained PC port with explicit Android 16 support, or develop the required PC device/kernel integration.
3. Integrate NovaDroid branding and custom defaults in a separate layer.
4. Add ISO boot packaging only after the PC image boots independently.
5. Test the resulting ISO in VirtualBox and record limitations.

## First customization set

- NovaDroid product/build identity
- NovaDroid wallpaper
- Boot animation
- Launcher defaults, if supported cleanly by the selected base
- A small set of documented system-property changes

Avoid replacing core Android framework components until the base image boots reliably.

## VirtualBox test checklist

- ISO boots to Android without a boot loop
- Display resolution is usable
- Keyboard and mouse input work
- Android reaches the launcher
- Network connectivity works if supported by the virtual hardware
- Reboot returns to a working system

## Release status

NovaDroid has not produced an ISO yet. No build is considered complete until the exact source revision, build environment, output artifact, and VirtualBox test result are recorded.