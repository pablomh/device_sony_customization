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

# TWRP: Encryption with FBE
TW_INCLUDE_CRYPTO     := true
TW_INCLUDE_CRYPTO_FBE := true

# TWRP: These properties may change on a per-device basis
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_NO_SCREEN_BLANK := true

# init
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_INITRC := device/sony/customization/cust_twrp/init.twrp.rc

ifneq ($(filter loire,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_loire.fstab
endif

ifneq ($(filter tone,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_tone.fstab
endif

ifneq ($(filter nile,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_nile.fstab
endif

ifneq ($(filter yoshino,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/trwp_yoshino.fstab
endif

ifneq ($(filter tama,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_tama.fstab
endif

# Debug: Print TWRP fstab path for inclusion bug verification
#$(warning CustomizationTWRP: Using fstab $(TARGET_RECOVERY_FSTAB) for TWRP Recovery)

# Install kernel modules to root directory
NEED_KERNEL_MODULE_ROOT := true

TARGET_RECOVERY_DEVICE_MODULES += \
      libEGL \
      libGLESv2 \
      android.hardware.graphics.allocator@2.0 \
      android.hardware.graphics.common@1.0 \
      android.hardware.graphics.mapper@2.0 \
      android.hardware.configstore@1.0 \
      android.hardware.configstore-utils \
      android.hardware.graphics.bufferqueue@1.0 \
      android.hardware.media@1.0 \
      android.hidl.token@1.0 \
      android.hidl.token@1.0-utils \
      libbinder \
      libgui \
      libnativebridge \
      libnativehelper \
      libnativeloader \
      libnativewindow \
      libprotobuf-cpp-lite \
      libsync \
      libui

# Dependencies of libsecureui.so
TARGET_RECOVERY_DEVICE_MODULES += \
      libEGL \
      libGLESv2 \
      android.hardware.graphics.allocator@2.0 \
      android.hardware.graphics.common@1.0 \
      android.hardware.graphics.mapper@2.0 \
      android.hardware.configstore@1.0 \
      android.hardware.configstore-utils \
      android.hardware.graphics.bufferqueue@1.0 \
      android.hardware.media@1.0 \
      android.hidl.token@1.0 \
      android.hidl.token@1.0-utils \
      libbinder \
      libgui \
      libnativebridge \
      libnativehelper \
      libnativeloader \
      libnativewindow \
      libprotobuf-cpp-lite \
      libsync \
      libui

TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
      $(OUT)/system/lib64/libEGL.so \
      $(OUT)/system/lib64/libGLESv2.so \
      $(OUT)/system/lib64/android.hardware.graphics.allocator@2.0.so \
      $(OUT)/system/lib64/android.hardware.graphics.common@1.0.so \
      $(OUT)/system/lib64/android.hardware.graphics.mapper@2.0.so \
      $(OUT)/system/lib64/android.hardware.configstore@1.0.so \
      $(OUT)/system/lib64/android.hardware.configstore-utils.so \
      $(OUT)/system/lib64/android.hardware.graphics.bufferqueue@1.0.so \
      $(OUT)/system/lib64/android.hardware.media@1.0.so \
      $(OUT)/system/lib64/android.hidl.token@1.0.so \
      $(OUT)/system/lib64/android.hidl.token@1.0-utils.so \
      $(OUT)/system/lib64/libbinder.so \
      $(OUT)/system/lib64/libgui.so \
      $(OUT)/system/lib64/libnativebridge.so \
      $(OUT)/system/lib64/libnativehelper.so \
      $(OUT)/system/lib64/libnativeloader.so \
      $(OUT)/system/lib64/libnativewindow.so \
      $(OUT)/system/lib64/libprotobuf-cpp-lite.so \
      $(OUT)/system/lib64/libsync.so \
      $(OUT)/system/lib64/libui.so

# Required for keymaster
TARGET_RECOVERY_DEVICE_MODULES += \
      hwservicemanager \
      libhidl-gen-utils \
      libtinyxml2 \
      libvintf

TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
      $(OUT)/system/bin/hwservicemanager \
      $(OUT)/system/lib64/libhidl-gen-utils.so \
      $(OUT)/system/lib64/libtinyxml2.so \
      $(OUT)/system/lib64/libvintf.so

# Required by android.hardware.keymaster-3.0-service
TARGET_RECOVERY_DEVICE_MODULES      += libhardware_legacy
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/lib64/libhardware_legacy.so

# Required by android.hardware.gatekeeper-1.0-service
TARGET_RECOVERY_DEVICE_MODULES      += android.hardware.gatekeeper@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/lib64/android.hardware.gatekeeper@1.0.so

# Required by android.hardware.boot-1.0-service
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES := ${OUT}/system/lib64/android.hardware.boot@1.0.so

# Add strace
TARGET_RECOVERY_DEVICE_MODULES      += strace
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/xbin/strace

PRODUCT_COPY_FILES += \
    device/sony/customization/cust_twrp/manifest.xml:recovery/root/vendor/manifest.xml \
    device/sony/customization/cust_twrp/init.twrp.rc:root/init.twrp.rc
