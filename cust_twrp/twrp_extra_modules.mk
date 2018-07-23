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

LOCAL_PATH := device/sony/customization/cust_twrp

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
ifeq ($(AB_OTA_UPDATER),true)
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES := $(OUT)/system/lib64/android.hardware.boot@1.0.so
endif

# Add strace
TARGET_RECOVERY_DEVICE_MODULES      += strace
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/xbin/strace

# Qseecom dependencies
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sbin/android.hardware.gatekeeper@1.0-service-qti:recovery/root/sbin/android.hardware.gatekeeper@1.0-service-qti \
    $(LOCAL_PATH)/sbin/android.hardware.keymaster@3.0-service-qti:recovery/root/sbin/android.hardware.keymaster@3.0-service-qti \
    $(LOCAL_PATH)/sbin/qseecomd:recovery/root/sbin/qseecomd \
    $(LOCAL_PATH)/vendor/manifest.xml:recovery/root/$(TARGET_COPY_OUT_VENDOR)/manifest.xml \
    $(LOCAL_PATH)/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so \
    $(LOCAL_PATH)/vendor/lib64/hw/android.hardware.keymaster@3.0-impl-qti.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl-qti.so \
    $(LOCAL_PATH)/vendor/lib64/libdiag.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdiag.so \
    $(LOCAL_PATH)/vendor/lib64/libdrmfs.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdrmfs.so \
    $(LOCAL_PATH)/vendor/lib64/libdrmtime.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdrmtime.so \
    $(LOCAL_PATH)/vendor/lib64/libGPreqcancel.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libGPreqcancel.so \
    $(LOCAL_PATH)/vendor/lib64/libGPreqcancel_svc.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libGPreqcancel_svc.so \
    $(LOCAL_PATH)/vendor/lib64/libkeymasterdeviceutils.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymasterdeviceutils.so \
    $(LOCAL_PATH)/vendor/lib64/libqisl.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libqisl.so \
    $(LOCAL_PATH)/vendor/lib64/libQSEEComAPI.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libQSEEComAPI.so \
    $(LOCAL_PATH)/vendor/lib64/librpmb.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/librpmb.so \
    $(LOCAL_PATH)/vendor/lib64/libssd.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libssd.so \
    $(LOCAL_PATH)/vendor/lib64/libtime_genoff.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libtime_genoff.so

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/lib64/libgptutils.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libgptutils.so
endif
