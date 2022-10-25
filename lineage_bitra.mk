#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common ArrowOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# chipset flag (one word only/no spacing)
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rice.chipset", "Snapdragon 870 5G");
RICE_CHIPSET := Snapdragon-870

# maintainer flag (one word only/no spacing)
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rice.maintainer", "get riced");
RICE_MAINTAINER := Blackmanx

# package type flag (one word only/no spacing)
# this will reflect on build/display version, a firmware package/zip name 
# e.g. riceDroid-7.0-COMMUNITY-device-AOSP.zip - AOSP is the default package type, WITH_GMS will override the package type to PIXEL
RICE_PACKAGE_TYPE := PIXEL

# Sushi Bootanimation (only 720/1080p/1440 supported. if not defined, bootanimation is google bootanimation)
SUSHI_BOOTANIMATION := 1080

# Graphene Camera
TARGET_BUILD_GRAPHENEOS_CAMERA := false

# disable/enable blur support, default is false
TARGET_ENABLE_BLUR := false

# UDFPS ICONS/ANIMATIONS
TARGET_HAS_UDFPS := true

# Allow usage of custom binary linker (LD), default is false
TARGET_KERNEL_OPTIONAL_LD := false

# Spoof build description/fingerprint as pixel device
TARGET_USE_PIXEL_FINGERPRINT := true

# GMS build flags, if none were defined the package build type will be AOSP
WITH_GMS := true
TARGET_OPTOUT_GOOGLE_TELEPHONY := false

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_bitra
PRODUCT_DEVICE := bitra
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3370
PRODUCT_MANUFACTURER := realme

PRODUCT_SYSTEM_NAME := RMX3370
PRODUCT_SYSTEM_DEVICE := RE879AL1

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX3370-user 12 RKQ1.211103.002 R.202209132115 release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := realme/RMX3370/RE879AL1:12/RKQ1.211103.002/R.202209132115:user/release-keys