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

ifneq ($(filter loire,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_loire.fstab
endif

ifneq ($(filter tone,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_tone.fstab
endif

ifneq ($(filter nile,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_nile.fstab
endif

ifneq ($(filter yoshino,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_yoshino.fstab
endif

ifneq ($(filter tama,$(SOMC_PLATFORM)),)
TARGET_RECOVERY_FSTAB := device/sony/customization/cust_twrp/twrp_tama.fstab
endif

# Debug: Print TWRP fstab path for inclusion bug verification
#$(warning CustomizationTWRP: Using fstab $(TARGET_RECOVERY_FSTAB) for TWRP Recovery)

