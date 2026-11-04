# NovaDroid Roadmap

## Android 16 x86_64 baseline

- [x] Initialize NovaDroid repository
- [x] Choose Android 16 source baseline (`android-16.0.0_r4`)
- [x] Add manual self-hosted GitHub Actions build workflow
- [x] Add Android 16 x86_64 build script
- [ ] Validate the lunch target against the pinned source tree
- [ ] Run the first successful Cuttlefish build
- [ ] Verify and document the resulting emulator images

## PC ISO

- [ ] Identify or develop an Android 16-compatible PC kernel/device/boot integration
- [ ] Produce a bootable x86_64 live ISO
- [ ] Boot-test the ISO in VirtualBox
- [ ] Fix display, keyboard, mouse, and networking issues found in testing
- [ ] Publish checksums, known limitations, and test instructions

## Customization

- [ ] Add NovaDroid wallpapers and visual identity
- [ ] Add a NovaDroid boot animation
- [ ] Customize launcher defaults
- [ ] Review default apps and system properties

## Later targets

- [ ] Revisit the experimental ARM64 emulator product
- [ ] Evaluate physical-device support only after choosing a specific supported device

A roadmap item is not complete until its result has been built or verified where applicable.