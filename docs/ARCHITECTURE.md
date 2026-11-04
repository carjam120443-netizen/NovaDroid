# NovaDroid architecture

NovaDroid is intended to become an AOSP-based Android distribution with a mostly stock Android user experience.

## Core layers

1. **AOSP platform** — Android framework, system services, core apps, build system, and platform components maintained upstream by the Android Open Source Project.
2. **NovaDroid product configuration** — product identity, build properties, default packages, overlays, and project-specific configuration.
3. **Device support** — device-specific configuration, kernel, hardware interfaces, and vendor components. This must be developed for a specific, supported device; it cannot be assumed to work on every Android phone.
4. **Release engineering** — reproducible builds, image validation, checksums, release notes, and installation instructions.

## Current implementation status

The repository currently contains project documentation and development utilities. It does **not** yet contain a complete Android platform tree, a device tree, a kernel, vendor blobs, or flashable images.

## Design principles

- Keep the user interface close to stock Android.
- Prefer upstream AOSP components over unnecessary forks.
- Keep device-specific code separate from common project configuration.
- Never label an image flashable until it has been built and tested for its exact target device.
- Document known limitations and recovery requirements before publishing device installation instructions.
