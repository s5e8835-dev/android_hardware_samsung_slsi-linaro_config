
PRODUCT_SOONG_NAMESPACES += hardware/samsung_slsi-linaro/exynos/gralloc/gralloc3

ifeq ($(BOARD_USES_EXYNOS_AFBC_FEATURE), true)
$(call soong_config_set,arm_gralloc,uses_exynos_afbc_feature,true)
endif

# Used for WFD on exynos3830
ifeq ($(TARGET_SOC_BASE), exynos3830)
$(call soong_config_set,arm_gralloc,gralloc_scaler_wfd,true)
endif

# Disable AFBC on secure buffers for exynos9830 based SOC
ifeq ($(TARGET_SOC_BASE), exynos9830)
$(call soong_config_set,arm_gralloc,GRALLOC_SECURE_BUFFER_NO_AFBC,true)
endif

# DPU support RGBA1010102 AFBC
ifeq ($(TARGET_SOC), exynos2100)
$(call soong_config_set,arm_gralloc,GRALLOC_DPU_SUPPORT_1010102_AFBC,true)
endif

# Disable ION debug handle import on 7885
ifeq ($(TARGET_SOC), exynos7885)
$(call soong_config_set,arm_gralloc,gralloc_ion_handle_import,false)
$(call soong_config_set,arm_gralloc,GRALLOC_7885_WA,true)
endif

# HEVC Encoder H/W restriction
ifneq ($(filter exynos7885 exynos7872,$(TARGET_SOC_BASE)),)
ifneq ($(BOARD_MFC_CHROMA_VALIGN),)
$(call soong_config_set,arm_gralloc,MFC_CHROMA_VALIGN,$(BOARD_MFC_CHROMA_VALIG))
endif
endif

ifeq ($(BOARD_USES_EXYNOS_DATASPACE_FEATURE), true)
$(call soong_config_set,arm_gralloc,uses_exynos_dataspace_feature,true)
endif

ifeq ($(BOARD_USES_GRALLOC_ION_SYNC), true)
$(call soong_config_set,arm_gralloc,gralloc_ion_sync,true)
endif

ifneq ($(BOARD_EXYNOS_S10B_FORMAT_ALIGN),)
$(call soong_config_set,arm_gralloc,exynos_s10b_format_align,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif

ifeq ($(BOARD_USES_ALIGN_RESTRICTION), true)
$(call soong_config_set,arm_gralloc,uses_align_restriction,true)
endif

