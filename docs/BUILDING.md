# Build preparation

## Important distinction

This repository is the NovaDroid project layer; it is not the Android source tree. A full AOSP build requires downloading Google's Android source and using a supported 64-bit Linux build environment.

AOSP builds are resource-intensive. Google's published guidance has called for roughly 64 GB of RAM and hundreds of gigabytes of free disk space for a comfortable build environment. A small virtual machine on a 16 GB host is not a practical full-build machine.

## Planned workflow

1. Choose an AOSP release and record its matching source branch or manifest.
2. Prepare a supported Linux build host with sufficient RAM and storage.
3. Download the AOSP source using Google's repo tool.
4. Build and boot an unmodified AOSP emulator target first.
5. Add NovaDroid product configuration and branding in a separate layer.
6. Select one supported physical device before attempting device-specific work.
7. Build, validate, document, and test images before calling them installable.

## What this repository can do now

- Track NovaDroid's design and development decisions.
- Hold project-owned configuration, scripts, overlays, and documentation.
- Track device-support work separately from the upstream Android source.

Do not put a full AOSP checkout or large build outputs in this Git repository.
