#
# Copyright (C) 2022 The LineageOS Project
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

TARGET_BOARD_KERNEL_HEADERS := hardware/samsung_slsi-linaro/exynos/kernel-$(TARGET_LINUX_KERNEL_VERSION)-headers/kernel-headers
TARGET_SLSI_VARIANT := linaro
TARGET_SOC_NAME := exynos
BOARD_USES_DT := true

TARGET_RECOVERY_UI_BRIGHTNESS_FILE := /sys/class/backlight/panel/brightness
TARGET_RECOVERY_UI_MAX_BRIGHTNESS_FILE := /sys/class/backlight/panel/max_brightness

# Acryl
$(call soong_config_set,libacryl,target_soc_base,$(TARGET_SOC_BASE))
ifneq ($(BOARD_LIBACRYL_DEFAULT_COMPOSITOR),)
$(call soong_config_set,libacryl,default_compositor,$(BOARD_LIBACRYL_DEFAULT_COMPOSITOR))
endif
ifneq ($(BOARD_LIBACRYL_DEFAULT_SCALER),)
$(call soong_config_set,libacryl,default_scaler,$(BOARD_LIBACRYL_DEFAULT_SCALER))
endif
ifneq ($(BOARD_LIBACRYL_DEFAULT_BLTER),)
$(call soong_config_set,libacryl,default_blter,$(BOARD_LIBACRYL_DEFAULT_BLTER))
endif
ifneq ($(BOARD_LIBACRYL_G2D9810_HDR_PLUGIN),)
$(call soong_config_set,libacryl,g2d9810_hdr_plugin,$(BOARD_LIBACRYL_G2D9810_HDR_PLUGIN))
endif

# exynosgraphicbuffer
ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION),0)
$(call soong_config_set,libgrallocwrapper,gralloc_version,none)
endif
ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION),1)
include hardware/samsung_slsi-linaro/config/gralloc1.mk
endif
ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION),3)
include hardware/samsung_slsi-linaro/config/gralloc3.mk
endif
ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION),4)
$(call soong_config_set,arm_gralloc,gralloc_version,four)
endif
ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION),sgr)
$(call soong_config_set,arm_gralloc,gralloc_version,four_sgr)
endif

# libexynosscaler
ifeq ($(BOARD_USES_SCALER_M2M1SHOT), true)
$(call soong_config_set,libexynosscaler,SCALER_USE_M2M1SHOT,true)
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set,libexynosscaler,HAS_SCALER_ALIGN_RESTRICTION,true)
endif

ifneq ($(filter 3.18 4.4, $(TARGET_LINUX_KERNEL_VERSION)),)
$(call soong_config_set,libexynosscaler,SCALER_USE_PREMUL_FMT,true)
endif

ifeq ($(BOARD_USES_LEGACY_LIBSCALER), true)
$(call soong_config_set,libexynosscaler,USE_LEGACY,true)
endif

# libexynosgdc
ifeq ($(BOARD_USES_LEGACY_LIBGDC), true)
$(call soong_config_set,libexynosgdc,use_legacy_function_alignment,true)
endif

# libsbwcwrapper
ifneq ($(BOARD_SBWC_WRAPPER_PRIORITY),)
$(call soong_config_set,sbwcwrapper,sbwcwrapper_priority,$(BOARD_SBWC_WRAPPER_PRIORITY))
endif

include hardware/samsung_slsi-linaro/config/hwc.mk
include hardware/samsung_slsi-linaro/config/openmax.mk
