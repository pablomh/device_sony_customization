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


# TWRP Recovery common configuration
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_NEW_ION_HEAP    := true
TW_MAX_BRIGHTNESS  := 4095
TW_DEFAULT_BRIGHTNESS := 2047
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES := ${OUT}/system/lib64/android.hardware.boot@1.0.so
TW_USE_TOOLBOX := true

# TWRP: Blacklist virtual mouse
TW_INPUT_BLACKLIST := "hbtp_vm"

# TWRP: FileSystem support
TW_INCLUDE_EXFAT   := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# TWRP: Encryption
TW_INCLUDE_CRYPTO := true

# TWRP: These properties may change on a per-device basis
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_NO_SCREEN_BLANK := true

# init
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_INITRC := device/sony/customization/cust_twrp/init.twrp.rc

ifneq ($(filter loire,$(PRODUCT_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_loire.fstab
endif

ifneq ($(filter tone,$(PRODUCT_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_tone.fstab
endif

ifneq ($(filter nile,$(PRODUCT_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_nile.fstab
endif

ifneq ($(filter yoshino,$(PRODUCT_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_yoshino.fstab
endif

# SELinux
BOARD_SEPOLICY_DIRS += device/sony/customization/sepolicy
