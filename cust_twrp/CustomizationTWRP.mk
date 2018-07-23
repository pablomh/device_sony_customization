# Copyright (C) 2018 The SonyAosp Project
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

include device/sony/customization/cust_twrp/twrp_fstab.mk
include device/sony/customization/cust_twrp/twrp_extra_modules.mk

WITH_TWRP := true

# TWRP Recovery common configuration
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_NEW_ION_HEAP    := true
TW_MAX_BRIGHTNESS  := 4095
TW_DEFAULT_BRIGHTNESS := 2047
TW_USE_TOOLBOX := true

# TWRP: Blacklist virtual mouse
TW_INPUT_BLACKLIST := "hbtp_vm"

# TWRP: FileSystem support
TW_INCLUDE_EXFAT   := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# TWRP: Encryption with FBE
TW_INCLUDE_CRYPTO     := true
TW_INCLUDE_CRYPTO_FBE := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true

# TWRP: These properties may change on a per-device basis
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_NO_SCREEN_BLANK := true

# init
TW_EXCLUDE_DEFAULT_USB_INIT := true

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    libgptutils \
    libz
endif

PRODUCT_PACKAGES += \
    init.recovery.usb
