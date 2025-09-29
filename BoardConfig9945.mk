#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_LINUX_KERNEL_VERSION := 6.1

TARGET_SOC_BASE := s5e9945

# Gralloc
BOARD_USES_EXYNOS_GRALLOC_VERSION := sgr
BOARD_USES_4K_SWIZZLE_MODE := true

# Codec2
BOARD_USE_CSC_FILTER := true
BOARD_SUPPORT_MFC_ENC_RGB := true
BOARD_USE_GDC := true
BOARD_USE_HDR10PLUS_STAT_ENC := true
BOARD_USE_FULL_ST2094_40 := true
BOARD_HDR_DYNAMIC_META_LIB := librechdr10plus.plugin.so
BOARD_HW_SUPPORT_FILMGRAIN := true
BOARD_SUPPORT_MFC_ENC_BT2020 := true
BOARD_GPU_TYPE := sgpu
BOARD_USE_SUPPORT_GPU_SBWC := true
BOARD_USE_FLEXIBLE_P010 := true

# HWComposer
BOARD_USES_DISPLAY_COLOR_INTERFACE := true
BOARD_USES_EXYNOS_SAJC_FEATURE := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
HWC_SUPPORT_COLOR_TRANSFORM := true

# HDR
# This shall be enabled by device tree as it requires a wrapper
# lib which is not part of BSP and shall be implemented at device
# tree level.
# BOARD_LIBHDR_PLUGIN := //device/samsung/s5e9945:libhdr_wrapper

# WifiDisplay
BOARD_USES_VIRTUAL_DISPLAY := true

# Acryl
BOARD_USES_DEFAULT_LIBHDR_HEADER := true
BOARD_LIBACRYL_DEFAULT_SCALER := mscl_sbwc_v2_8
BOARD_SBWC_WRAPPER_PRIORITY := mscl

include hardware/samsung_slsi-linaro/config/BoardConfigCommon.mk
