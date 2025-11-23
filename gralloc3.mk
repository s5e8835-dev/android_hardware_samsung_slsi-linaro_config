#
# Copyright (C) 2025 The LineageOS Project
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

$(call soong_config_set,arm_gralloc,gralloc_version,three)
ifeq ($(BOARD_USES_EXYNOS_AFBC_FEATURE), true)
$(call soong_config_set_bool,arm_gralloc,uses_exynos_afbc_feature,true)
endif

# Used for WFD on exynos3830
ifeq ($(TARGET_SOC_BASE), exynos3830)
$(call soong_config_set_bool,arm_gralloc,gralloc_scaler_wfd,true)
endif

# Disable AFBC on secure buffers for exynos9830 based SOC
ifeq ($(TARGET_SOC_BASE), exynos9830)
$(call soong_config_set_bool,arm_gralloc,GRALLOC_SECURE_BUFFER_NO_AFBC,true)
endif

# DPU support RGBA1010102 AFBC
ifeq ($(TARGET_SOC), exynos2100)
$(call soong_config_set_bool,arm_gralloc,GRALLOC_DPU_SUPPORT_1010102_AFBC,true)
endif

ifeq ($(BOARD_USES_EXYNOS_DATASPACE_FEATURE), true)
$(call soong_config_set_bool,arm_gralloc,uses_exynos_dataspace_feature,true)
endif

ifeq ($(BOARD_USES_GRALLOC_ION_SYNC), true)
$(call soong_config_set_bool,arm_gralloc,gralloc_ion_sync,true)
endif

ifneq ($(BOARD_EXYNOS_S10B_FORMAT_ALIGN),)
$(call soong_config_set_bool,arm_gralloc,exynos_s10b_format_align,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set_bool,arm_gralloc,uses_align_restriction,true)
endif

