# NovaDroid PC ISO plan

## Goal

Build a bootable x86_64 NovaDroid ISO that starts in VirtualBox on a Windows host. The first milestone is a live/test ISO, not an installer that modifies a physical disk.

## Why this is a separate target

The existing `vendor/nova/` product configuration inherits an ARM64 Goldfish emulator product. It cannot be used as an x86_64 PC ISO simply by changing the output filename. PC boot requires an x86_64 Android platform/device configuration, kernel and graphics support, and ISO packaging.

## Upstream direction

Evaluate the Android-Generic project and its associated Android-for-PC source trees. Bliss OS is a related project with public source repositories, but its public ISO releases are paused while a new source tree is being developed. Do not base a new release on an archived binary image or an old build guide without checking the exact source revision.

Useful upstream project references:

- Android-Generic: https://github.com/android-generic
- Bliss OS: https://github.com/BlissOS
- Bliss OS project/status information: https://blissos.org/status.html

These are research references, not yet a pinned NovaDroid build dependency.

## Build strategy

1. Inspect the current Android-Generic source and documentation.
2. Select one compatible Android release and pin exact manifest/repository revisions.
3. Follow that revision's documented x86_64 build workflow.
4. First build the upstream image without NovaDroid modifications.
5. Add NovaDroid branding and custom defaults in a separate project layer.
6. Build the ISO again and test it in VirtualBox.

## First customization set

- NovaDroid product name and build identity
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

## Resource note

The full Android build should run on a suitably sized Linux build host. The current Windows PC has 16 GB RAM, so a full local build inside a VM is not the recommended route. The source checkout and build output also require hundreds of gigabytes of storage depending on branch and build configuration.

## Release status

NovaDroid has not produced an ISO yet. No build is considered complete until the exact source revision, build environment, output artifact, and VirtualBox test result are recorded.