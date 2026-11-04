# Shared NovaDroid product identity and build properties.
# Include this from a device/product makefile after inheriting its AOSP base.

PRODUCT_BRAND := NovaDroid
PRODUCT_MANUFACTURER := NovaDroid
PRODUCT_MODEL := NovaDroid

PRODUCT_PRODUCT_PROPERTIES += \
    ro.nova.version=0.1.0 \
    ro.nova.channel=development
