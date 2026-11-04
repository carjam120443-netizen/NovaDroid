# Build preparation

## Initial target

The first NovaDroid deliverable is an x86_64 Android-for-PC ISO intended for VirtualBox testing. The existing ARM64 Goldfish product scaffold is a separate experimental target.

## Build host requirements

A full Android platform build is resource-intensive and requires a supported 64-bit Linux environment, substantial free disk space, and significant memory. The exact requirements depend on the selected upstream branch and its build system.

The project's current Windows PC has 16 GB RAM. That is not a comfortable environment for a full Android source build, especially inside a virtual machine. Do not try to solve this by creating a tiny Linux VM and expecting it to compile the entire OS. A larger Linux build host will be needed for the full build.

## Planned workflow

1. Select and pin a maintained Android-for-PC source branch and record its exact revision.
2. Confirm its documented build host and dependency requirements.
3. Prepare a suitably sized Linux build host.
4. Build the upstream x86_64 target unchanged and verify its ISO.
5. Integrate NovaDroid-owned branding and configuration in a separate layer.
6. Build the NovaDroid ISO and compare its output with the upstream baseline.
7. Boot-test the image in VirtualBox and document what works and what does not.

## Repository boundaries

- Keep project-owned configuration, overlays, scripts, and documentation in this repository.
- Keep the large Android source checkout outside this Git repository.
- Keep generated build output and ISO files outside Git unless a separate release-artifact process is intentionally established.

## Current status

No ISO build has been run or verified yet. Build commands will be added after the upstream source branch and exact build workflow are confirmed.