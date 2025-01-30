
$(call soong_config_set,arm_gralloc,gralloc_version,one)
ifeq ($(BOARD_USES_EXYNOS5_GRALLOC_RANGE_FLUSH), true)
$(call soong_config_set,arm_gralloc,DGRALLOC_RANGE_FLUSH,true)
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set,arm_gralloc,uses_align_restriction,true)
$(call soong_config_set,arm_gralloc,uses_10b_align_restriction,true)
endif

ifeq ($(TARGET_SOC_BASE), exynos9820)
$(call soong_config_set,arm_gralloc,uses_align_restriction,true)
endif

ifeq ($(BOARD_EXYNOS_S10B_FORMAT_ALIGN), 64)
$(call soong_config_set,arm_gralloc,exynos_s10b_format_align,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif

# HEVC Encoder H/W restriction
ifneq ($(BOARD_MFC_CHROMA_VALIGN),)
ifeq ($(TARGET_SOC_BASE), exynos7885)
$(call soong_config_set,arm_gralloc,MFC_CHROMA_VALIGN,$(BOARD_MFC_CHROMA_VALIGN))
endif
ifeq ($(TARGET_SOC_BASE), exynos7872)
$(call soong_config_set,arm_gralloc,MFC_CHROMA_VALIGN,$(BOARD_MFC_CHROMA_VALIGN))
endif
endif
