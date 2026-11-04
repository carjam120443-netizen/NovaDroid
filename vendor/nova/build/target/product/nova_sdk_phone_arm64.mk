# NovaDroid ARM64 emulator product.
# Base target is provided by AOSP's generic goldfish device configuration.

$(call inherit-product, device/generic/goldfish/64bitonly/product/sdk_phone64_arm64.mk)
$(call inherit-product, vendor/nova/build/target/product/nova_common.mk)

PRODUCT_NAME := nova_sdk_phone_arm64
PRODUCT_DEVICE := generic_arm64
PRODUCT_MODEL := NovaDroid SDK (ARM64)
