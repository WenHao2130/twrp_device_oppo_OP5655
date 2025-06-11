#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
TARGET_IS_VAB := true
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.lahaina.recovery \
    android.hardware.boot@1.1-impl-qti.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

#  Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock

# Screen
TARGET_SCREEN_HEIGHT := 2412
TARGET_SCREEN_WIDTH := 1080

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    libandroidicu

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=$(PRODUCT_RELEASE_NAME)