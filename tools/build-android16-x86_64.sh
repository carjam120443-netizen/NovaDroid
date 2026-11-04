#!/usr/bin/env bash
set -Eeuo pipefail

# Build an Android 16 x86_64 Cuttlefish baseline. This produces emulator
# images, NOT a PC-bootable ISO. ISO packaging requires a separate PC port.

AOSP_DIR="${AOSP_DIR:-${RUNNER_TEMP:-/tmp}/novadroid-aosp16}"
AOSP_TAG="${AOSP_TAG:-android-16.0.0_r4}"
LUNCH_TARGET="${LUNCH_TARGET:-aosp_cf_x86_64_only_phone-aosp_current-userdebug}"
SYNC_JOBS="${SYNC_JOBS:-8}"
BUILD_JOBS="${BUILD_JOBS:-$(nproc)}"

fail() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

[[ "$(uname -s)" == Linux ]] || fail "Android builds must run on a supported Linux host."
command -v repo >/dev/null 2>&1 || fail "The Android repo launcher is missing. Install Google's repo tool on the build host first."
command -v git >/dev/null 2>&1 || fail "git is required."
command -v python3 >/dev/null 2>&1 || fail "python3 is required."
[[ "$SYNC_JOBS" =~ ^[1-9][0-9]*$ ]] || fail "SYNC_JOBS must be a positive integer."
[[ "$BUILD_JOBS" =~ ^[1-9][0-9]*$ ]] || fail "BUILD_JOBS must be a positive integer."

printf 'NovaDroid Android 16 baseline build\n'
printf 'Source tag: %s\nLunch target: %s\nAOSP directory: %s\n' "$AOSP_TAG" "$LUNCH_TARGET" "$AOSP_DIR"
printf '\nBuild host:\n'
uname -a
free -h || true
df -h "$(dirname "$AOSP_DIR")" || true

if [[ -e "$AOSP_DIR" && ! -d "$AOSP_DIR/.repo" ]]; then
  fail "$AOSP_DIR exists but is not an initialized AOSP checkout. Move it aside yourself or choose another AOSP_DIR; this script will not delete it."
fi

mkdir -p "$AOSP_DIR"
cd "$AOSP_DIR"
if [[ ! -d .repo ]]; then
  repo init -u https://android.googlesource.com/platform/manifest -b "$AOSP_TAG" --depth=1
else
  printf 'Reusing existing repo checkout. Confirm its manifest branch matches AOSP_TAG=%s.\n' "$AOSP_TAG"
fi

repo sync -c -j"$SYNC_JOBS" --no-tags --no-clone-bundle

bash -c 'set -euo pipefail; source build/envsetup.sh; lunch "$1"; m -j"$2"' _ "$LUNCH_TARGET" "$BUILD_JOBS"

printf '\nBuild finished. Expected Cuttlefish output directory: %s\n' "$AOSP_DIR/out/target/product/vsoc_x86_64"
printf 'This is an Android emulator image set, not a bootable PC ISO.\n'