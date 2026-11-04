# Build preparation

## Current build target

The first automated milestone is an Android 16 x86_64 AOSP Cuttlefish baseline build. It produces emulator images, not a PC-bootable ISO. See [`ANDROID-16-BOOTSTRAP.md`](ANDROID-16-BOOTSTRAP.md) for the pinned source tag, target, workflow, and runner requirements.

The intended VirtualBox ISO remains a later milestone. It requires a PC-specific Android 16 kernel/device configuration and boot/ISO packaging; an emulator image or GSI is not sufficient.

## Build host requirements

A full Android platform build is resource-intensive and requires a supported 64-bit Linux environment, substantial free disk space, and significant memory. The exact requirements depend on the selected upstream branch and build configuration.

The project's current Windows PC has 16 GB RAM. That is not a comfortable environment for a full Android source build, especially inside a virtual machine. The GitHub Actions workflow therefore expects a dedicated self-hosted Linux runner rather than a standard hosted runner.

## Workflow

1. Prepare a Linux self-hosted GitHub Actions runner with the `android-build` label and the dependencies described in `ANDROID-16-BOOTSTRAP.md`.
2. Run **Android 16 x86_64 baseline** manually from the repository's Actions tab.
3. Download and inspect the resulting Cuttlefish image artifact.
4. Validate the exact Android 16 PC integration before attempting ISO packaging.
5. Add NovaDroid branding and custom defaults in a separate project layer.
6. Build and boot-test the eventual ISO in VirtualBox.

## Repository boundaries

- Keep project-owned configuration, overlays, scripts, and documentation in this repository.
- Keep the large Android source checkout outside this Git repository.
- Keep generated build output and ISO files outside Git; publish verified release artifacts separately.

## Current status

The workflow and script have been committed but have not yet been executed. The requested lunch target and output paths still need validation on the prepared Android 16 build host. No ISO build has been run.