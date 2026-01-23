#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call soong_config_set,arm_gralloc,gralloc_version,four)

ifeq ($(BOARD_GPU_SUPPORT_AFBC_BASIC), true)
$(call soong_config_set_bool,arm_gralloc,mali_gpu_support_afbc_basic,true)
endif

ifeq ($(BOARD_GRALLOC_DPU_SUPPORT_1010102_AFBC), true)
$(call soong_config_set_bool,arm_gralloc,GRALLOC_DPU_SUPPORT_1010102_AFBC,true)
endif

ifeq ($(BOARD_GRALLOC_INIT_AFBC), true)
$(call soong_config_set_bool,arm_gralloc,gralloc_init_afbc,true)
endif

ifeq ($(BOARD_GRALLOC_NO_EXTERNAL_AFBC), true)
$(call soong_config_set_bool,arm_gralloc,gralloc_arm_no_external_afbc,true)
endif

ifeq ($(BOARD_USES_EXYNOS_AFBC_FEATURE), true)
$(call soong_config_set_bool,arm_gralloc,uses_exynos_afbc_feature,true)
endif

ifeq ($(BOARD_USES_EXYNOS_DATASPACE_FEATURE), true)
$(call soong_config_set_bool,arm_gralloc,uses_exynos_dataspace_feature,true)
endif

ifeq ($(BOARD_USES_GRALLOC_ION_SYNC), true)
$(call soong_config_set_bool,arm_gralloc,gralloc_ion_sync_on_lock,true)
endif

ifneq ($(BOARD_EXYNOS_S10B_FORMAT_ALIGN),)
$(call soong_config_set,arm_gralloc,exynos_s10b_format_align,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set_bool,arm_gralloc,uses_align_restriction,true)
endif
