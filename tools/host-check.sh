#!/usr/bin/env bash
# Read-only readiness check for a future NovaDroid AOSP build host.
set -u

pass() { printf '[ OK ] %s\n' "$1"; }
warn() { printf '[WARN] %s\n' "$1"; }
fail() { printf '[FAIL] %s\n' "$1"; }

printf 'NovaDroid host readiness check\n'
printf '%s\n' '==============================='

if [[ "$(uname -s)" == "Linux" ]]; then
  pass "Running Linux"
else
  fail "AOSP platform builds require a supported Linux environment"
fi

if [[ "$(uname -m)" == "x86_64" ]]; then
  pass "64-bit x86 host"
else
  warn "Host architecture is $(uname -m); verify AOSP build-host support"
fi

if command -v python3 >/dev/null 2>&1; then pass "python3 is installed"; else warn "python3 is missing"; fi
for tool in git curl repo; do
  if command -v "$tool" >/dev/null 2>&1; then pass "$tool is installed"; else warn "$tool is missing"; fi
done

if [[ -r /proc/meminfo ]]; then
  mem_kb="$(awk '/MemTotal:/ {print $2}' /proc/meminfo)"
  mem_gb=$((mem_kb / 1024 / 1024))
  printf '      Detected RAM: %s GiB\n' "$mem_gb"
  if (( mem_gb >= 64 )); then pass "RAM meets the commonly recommended AOSP build-host scale"; else warn "RAM is below the commonly recommended ~64 GiB AOSP build-host scale"; fi
fi

if command -v df >/dev/null 2>&1; then
  free_kb="$(df -Pk . | awk 'NR==2 {print $4}')"
  free_gb=$((free_kb / 1024 / 1024))
  printf '      Free space here: %s GiB\n' "$free_gb"
  if (( free_gb >= 400 )); then pass "Free disk space is in the recommended AOSP build range"; else warn "Less than 400 GiB free here; a full AOSP checkout/build may not fit"; fi
fi

printf '\nThis script only checks the host. It does not install packages, download\n'
printf 'Android source, change system settings, or build/flash an image.\n'
