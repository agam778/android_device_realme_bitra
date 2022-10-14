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
TARGET_OPTOUT_GOOGLE_TELEPHONY := true

# We took some of Code Linaro optimizations and ported it to AOSP,
# But due to some stuffs we were not able to make the system parse the device perfconfigstore.xml automatically
# builders might need to tune runtime properties listed below (with reference and CLO counterparts)

# memory management [2]
#persist.sys.fw.bg_apps_limit=96

# Adapted LMKD [1] & [2]
# kill_heaviest_task_dup
#ro.lmk.kill_heaviest_task=true
# kill_timeout_ms_dup
#ro.lmk.kill_timeout_ms=100
# thrashing_threshold
#ro.lmk.thrashing_limit=30
# thrashing_decay
#ro.lmk.thrashing_limit_decay=5
# nstrat_low_swap
#ro.lmk.swap_free_low_percentage=10
# nstrat_psi_partial_ms
#ro.lmk.psi_partial_stall_ms=70
# nstrat_psi_complete_ms
#ro.lmk.psi_complete_stall_ms=70
# use_new_strategy_dup
#ro.lmk.use_new_strategy=true
# CLO lmkd [1] - others were not defined (will use default values from lmkd binary)
#ro.lmk.psi_scrit_complete_stall_ms=75
#ro.lmk.nstrat_wmark_boost_factor=4
#ro.lmk.enable_watermark_check=true
#ro.lmk.enable_userspace_lmk=true
#ro.lmk.super_critical=701
#ro.lmk.direct_reclaim_pressure=45
#ro.lmk.reclaim_scan_threshold=0

# app compaction - [1] & [2]
# disabled app compaction due to app freezes when switching tasks
#persist.sys.appcompact.enable_app_compact=false
#persist.sys.appcompact.full_compact_type=2
#persist.sys.appcompact.some_compact_type=4
#persist.sys.appcompact.compact_throttle_somesome=5000
#persist.sys.appcompact.compact_throttle_somefull=10000
#persist.sys.appcompact.compact_throttle_fullsome=500
#persist.sys.appcompact.compact_throttle_fullfull=10000
#persist.sys.appcompact.compact_throttle_bfgs=600000
#persist.sys.appcompact.compact_throttle_persistent=600000
#persist.sys.appcompact.rss_throttle_kb=12000
#persist.sys.appcompact.delta_rss_throttle_kb=8000
#persist.sys.perf.topAppRenderThreadBoost.enable=false


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
    PRIVATE_BUILD_DESC="redfin-user-13-TP1A.221005.002-9012097-release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := google/redfin/redfin:13/TP1A.221005.002/9012097:user/release-keys
PRODUCT_OVERRIDE_GMS_FINGERPRINT := google/redfin/redfin:13/TP1A.221005.002/9012097:user/release-keys