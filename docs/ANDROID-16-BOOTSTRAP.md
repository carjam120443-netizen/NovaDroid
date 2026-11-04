# Android 16 x86_64 bootstrap

## Pinned baseline

- Android source tag: `android-16.0.0_r4`
- Initial target: `aosp_cf_x86_64_only_phone-aosp_current-userdebug`
- Intended output: AOSP Cuttlefish x86_64 emulator images
- Build script: `tools/build-android16-x86_64.sh`
- Workflow: `.github/workflows/android16-x86_64.yml`

The Android 16 tag is recorded in the official AOSP build/tag reference. The x86_64 Cuttlefish lunch target follows the AOSP build documentation's example target family.

## Important: this is not an ISO yet

AOSP's Cuttlefish target produces virtual-device images for the Cuttlefish environment. It does not produce a PC bootable ISO for VirtualBox. A generic Android 16 x86_64 GSI is also not a complete PC operating system: it is a system image intended for supported Treble devices, and does not include the PC bootloader, kernel/device support, or ISO boot layout.

This bootstrap gives NovaDroid a pinned Android 16 x86_64 build baseline and a repeatable build job. A separate PC port is still required before an ISO can be generated.

## Runner requirements

The workflow intentionally uses a self-hosted Linux runner labelled `android-build`. A normal GitHub-hosted runner is not assumed to have enough disk, memory, or build time for a complete Android source build.

Prepare the runner with:

- A supported 64-bit Linux distribution
- Google's `repo` launcher, Git, Python 3, and AOSP build dependencies
- At least 64 GB RAM recommended for a comfortable full build
- Several hundred GB of free SSD storage; reserve around 400 GB or more
- A stable network connection

The workflow does not install packages or change runner configuration.

## Run it

1. Configure a trusted self-hosted Linux GitHub Actions runner with labels `self-hosted`, `linux`, `x64`, and `android-build`.
2. Make sure the runner has the required AOSP dependencies and disk space.
3. Open Actions in the NovaDroid repository.
4. Run **Android 16 x86_64 baseline** using the default lunch target.
5. Download the artifact if the build succeeds.

The workflow is manual-only. It does not run on every push and does not deploy or install anything.

## Local invocation

On a prepared Linux build host with `repo` installed:

```bash
AOSP_TAG=android-16.0.0_r4 \
LUNCH_TARGET=aosp_cf_x86_64_only_phone-aosp_current-userdebug \
bash tools/build-android16-x86_64.sh
```

Set `AOSP_DIR`, `SYNC_JOBS`, or `BUILD_JOBS` to override their defaults. The script refuses to reuse a directory that exists but is not already an AOSP checkout, and it never deletes the checkout.

## Next engineering milestone

Validate that the selected Android 16 tag exposes the requested lunch target, build the baseline successfully, then choose an Android-for-PC kernel/device/boot-image integration that explicitly supports Android 16. Only after that integration exists should NovaDroid add an ISO packaging job.