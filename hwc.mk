#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifndef TARGET_SOC_BASE
	TARGET_SOC_BASE := $(TARGET_SOC)
endif

$(call soong_config_set,exynos_hwc,target_soc_base,$(TARGET_SOC_BASE))

ifdef BOARD_LIBHDR_PLUGIN
$(call soong_config_set_bool,exynos_hwc,USE_LIBHDR_PLUGIN,true)
$(call soong_config_set,exynos_hwc,libhdr_plugin,$(BOARD_LIBHDR_PLUGIN))
endif

ifdef BOARD_LIBHDR10P_META_PLUGIN
$(call soong_config_set_bool,exynos_hwc,USE_LIBHDR10P_META_PLUGIN,true)
$(call soong_config_set,exynos_hwc,libhdr10p_meta_plugin,$(BOARD_LIBHDR10P_META_PLUGIN))
endif

ifeq ($(BOARD_USES_DQE_INTERFACE), true)
$(call soong_config_set_bool,exynos_hwc,uses_dqe_interface,true)
endif

ifeq ($(BOARD_USES_DISPLAY_COLOR_INTERFACE), true)
$(call soong_config_set_bool,exynos_hwc,uses_display_color_interface,true)
endif

ifeq ($(HWC_SUPPORT_COLOR_TRANSFORM), true)
$(call soong_config_set_bool,exynos_hwc,HWC_SUPPORT_COLOR_TRANSFORM,true)
endif

ifeq ($(TARGET_USES_DISPLAY_RENDER_INTENTS), true)
$(call soong_config_set_bool,exynos_hwc,HWC_SUPPORT_RENDER_INTENT,true)
endif

ifeq ($(BOARD_USES_VIRTUAL_DISPLAY), true)
$(call soong_config_set_bool,exynos_hwc,USES_VIRTUAL_DISPLAY,true)
endif

ifeq ($(TARGET_ARCH), arm64)
$(call soong_config_set_bool,exynos_hwc,USES_ARCH_ARM64,true)
endif

ifeq ($(BOARD_USES_DECON_64BIT_ADDRESS), true)
$(call soong_config_set_bool,exynos_hwc,USES_DECON_64BIT_ADDRESS,true)
endif

ifeq ($(BOARD_USES_EXYNOS_SAJC_FEATURE), true)
$(call soong_config_set_bool,exynos_hwc,USES_SAJC_FEATURE,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), 1)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION1,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), 3)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION1,true)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION3,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), 4)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION1,true)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION3,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), sgr)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION1,true)
$(call soong_config_set_bool,exynos_hwc,GRALLOC_VERSION3,true)
endif

ifeq ($(BOARD_USES_HDRUI_GLES_CONVERSION), true)
$(call soong_config_set_bool,exynos_hwc,USES_HDR_GLES_CONVERSION,true)
endif

ifeq ($(BOARD_USES_DOZEMODE), true)
$(call soong_config_set_bool,exynos_hwc,USES_DOZEMODE,true)
endif


ifeq ($(BOARD_USES_HWC_CPU_PERF_MODE), true)
$(call soong_config_set_bool,exynos_hwc,USES_HWC_CPU_PERF_MODE,true)
endif

ifeq ($(BOARD_USES_DUAL_DISPLAY), true)
$(call soong_config_set_bool,exynos_hwc,USES_DUAL_DISPLAY,true)
endif

ifeq ($(BOARD_USES_HDR_INTERFACE), true)
$(call soong_config_set_bool,exynos_hwc,USE_HDR_INTERFACE,true)
endif

ifeq ($(BOARD_USES_DEFAULT_LIBHDR_HEADER), true)
$(call soong_config_set,exynos_hwc,libhdr_header_version,default)
else
$(call soong_config_set,exynos_hwc,libhdr_header_version,exynos9630)
endif

ifeq ($(BOARD_USES_DQE_INTERFACE), true)
$(call soong_config_set_bool,exynos_hwc,USE_DQE_INTERFACE,true)
endif

ifeq ($(BOARD_USES_DISPLAY_COLOR_INTERFACE), true)
$(call soong_config_set_bool,exynos_hwc,USE_DISPLAY_COLOR_INTERFACE,true)
endif

ifeq ($(HWC_DISABLE_WIN_UPDATE), true)
$(call soong_config_set_bool,exynos_hwc,HWC_DISABLE_WIN_UPDATE,true)
endif

ifeq ($(BOARD_USES_DYNAMIC_RECOMPOSITION), true)
$(call soong_config_set_bool,exynos_hwc,ENABLE_DYNAMIC_RECOMP,true)
endif

ifeq ($(BOARD_USES_HWC_FORCE_GPU), true)
$(call soong_config_set_bool,exynos_hwc,ENABLE_FORCE_GPU,true)
endif

ifeq ($(BOARD_USES_HWC_OLD_VSYNC_STRUCT), true)
$(call soong_config_set_bool,exynos_hwc,USE_NOT_RESERVED_FIELD,true)
endif

ifneq ($(BOARD_MINIMUM_DISPLAY_BRIGHTNESS),)
$(call soong_config_set,exynos_hwc,MINIMUM_DISPLAY_BRIGHTNESS,$(BOARD_MINIMUM_DISPLAY_BRIGHTNESS))
endif
