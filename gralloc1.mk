#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call soong_config_set,arm_gralloc,gralloc_version,one)
ifeq ($(BOARD_USES_EXYNOS5_GRALLOC_RANGE_FLUSH), true)
$(call soong_config_set_bool,arm_gralloc,DGRALLOC_RANGE_FLUSH,true)
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set_bool,arm_gralloc,uses_align_restriction,true)
$(call soong_config_set_bool,arm_gralloc,uses_10b_align_restriction,true)
endif

ifeq ($(TARGET_SOC_BASE), exynos9820)
$(call soong_config_set_bool,arm_gralloc,uses_align_restriction,true)
endif

ifeq ($(BOARD_EXYNOS_S10B_FORMAT_ALIGN), 64)
$(call soong_config_set,arm_gralloc,exynos_s10b_format_align,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif
