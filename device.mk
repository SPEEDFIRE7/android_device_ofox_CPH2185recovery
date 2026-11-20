#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/oppo/CPH2185

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Treble (ro.vendor.build.security_patch comes from VENDOR_SECURITY_PATCH
# in BoardConfig.mk - do not set it again here, the build rejects duplicates)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    ro.build.date.utc=1230768000

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# Libraries required by the prebuilt Trustonic keymaster / gatekeeper
# (libkeymaster4.so, libgatekeeper.so) - the services themselves are
# prebuilt in recovery/root (taken from the stock CPH2185 vendor).
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice \
    libgatekeeper

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so
