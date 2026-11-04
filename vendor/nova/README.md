# NovaDroid AOSP integration

This directory is the first Android build-system integration layer for NovaDroid.

## Initial target

- Product: `nova_sdk_phone_arm64`
- Lunch target: `nova_sdk_phone_arm64-userdebug`
- Base device configuration: AOSP `device/generic/goldfish/64bitonly/product/sdk_phone64_arm64.mk`
- Intended environment: an AOSP source checkout that includes the generic Goldfish ARM64 emulator product.

## Build integration

Copy or check out this repository's `vendor/nova` directory into the matching path in an AOSP source tree. Then run the standard AOSP environment setup and select the lunch target listed above.

These files define product identity and register an emulator product. They do not contain the Android framework, kernel, vendor binaries, device tree for a physical phone, or a prebuilt system image.

## Current limitations

- This is an emulator-first bring-up target, not a physical-device ROM.
- The referenced Goldfish product path must exist in the selected AOSP branch.
- The initial product configuration has not yet been validated by a complete AOSP build.
- Do not attempt to flash this emulator product onto a physical phone.