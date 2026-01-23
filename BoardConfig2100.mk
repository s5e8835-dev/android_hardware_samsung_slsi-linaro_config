#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_LINUX_KERNEL_VERSION := 5.4

TARGET_SOC_BASE := exynos2100

# Acryl
BOARD_LIBACRYL_DEFAULT_SCALER := mscl_votf

# Codec2
BOARD_USE_CSC_FILTER := true
BOARD_USE_DEC_SW_CSC := false
BOARD_SUPPORT_MFC_ENC_RGB := true
BOARD_SUPPORT_MFC_ENC_BT2020 := true
BOARD_USE_BLOB_ALLOCATOR := true

# Gralloc
BOARD_USES_ALIGN_RESTRICTION := true
BOARD_USES_EXYNOS_GRALLOC_VERSION := 4
BOARD_USES_GRALLOC_ION_SYNC := true
BOARD_GPU_SUPPORT_AFBC_BASIC := true
BOARD_GRALLOC_DPU_SUPPORT_1010102_AFBC := true
BOARD_GRALLOC_INIT_AFBC := true
BOARD_EXYNOS_S10B_FORMAT_ALIGN := 64
BOARD_USES_EXYNOS_DATASPACE_FEATURE := true

# Filmgrain
BOARD_HW_SUPPORT_FILMGRAIN := true

# HWComposer
HWC_SUPPORT_COLOR_TRANSFORM := true
# if AFBC is enabled, must set ro.vendor.ddk.set.afbc=1
BOARD_USES_EXYNOS_AFBC_FEATURE := true
BOARD_USES_VIRTUAL_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
BOARD_LIBHDR_PLUGIN := //vendor/samsung/universal2100-common:vendor.samsung.libcolor.hardware
BOARD_LIBHDR10P_META_PLUGIN := //vendor/samsung/universal2100-common:vendor.samsung.libcolor.hdr10plus

# Libhwjpeg
$(call soong_config_set,libhwjpeg,HWJPEG_ANDROID_VERSION,11)

# SBWC
BOARD_SBWC_WRAPPER_PRIORITY := dpuMscl

# Scaler
BOARD_DEFAULT_CSC_HW_SCALER := 4
BOARD_USES_SCALER_M2M1SHOT := true
BOARD_HAS_SCALER_ALIGN_RESTRICTION := true

include hardware/samsung_slsi-linaro/config/BoardConfigCommon.mk
