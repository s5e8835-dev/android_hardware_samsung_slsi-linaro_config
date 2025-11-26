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

TARGET_LINUX_KERNEL_VERSION := 5.10

TARGET_SOC_BASE := s5e9925

# Acryl
BOARD_LIBACRYL_DEFAULT_SCALER := mscl_votf

# Codec2
BOARD_GPU_TYPE := sgpu
BOARD_USE_GDC := true
BOARD_USE_CSC_FILTER := true
BOARD_SUPPORT_MFC_ENC_RGB := true
BOARD_SUPPORT_MFC_ENC_BT2020 := true
BOARD_HW_SUPPORT_FILMGRAIN := true
BOARD_USE_HDR10PLUS_STAT_ENC := true
BOARD_HDR_DYNAMIC_META_LIB := librechdr10plus.plugin.so

# Gralloc
BOARD_USES_EXYNOS_GRALLOC_VERSION := sgr

# HWC
HWC_SUPPORT_COLOR_TRANSFORM := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
BOARD_USES_EXYNOS_SAJC_FEATURE := true
BOARD_USES_VIRTUAL_DISPLAY := true
BOARD_USES_DISPLAY_COLOR_INTERFACE := true
BOARD_LIBHDR_PLUGIN := //vendor/samsung/s5e9925-common:vendor.samsung.libcolor.hardware
BOARD_LIBHDR10P_META_PLUGIN := //vendor/samsung/s5e9925-common:vendor.samsung.libcolor.hdr10plus

# Misc
BOARD_SBWC_WRAPPER_PRIORITY := mscl
BOARD_USES_LEGACY_LIBGDC := true

include hardware/samsung_slsi-linaro/config/BoardConfigCommon.mk
