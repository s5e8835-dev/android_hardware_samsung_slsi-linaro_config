#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

BOARD_USE_SKYPE_HD := true
EXYNOS_OMX_SUPPORT_TUNNELING := false
EXYNOS_OMX_SUPPORT_EGL_IMAGE := false


# only 3.4 kernel
ifeq ($(filter-out 3.4, $(TARGET_LINUX_KERNEL_VERSION)),)
$(call soong_config_set,openmax,USE_EXYNOS_MEDIA_EXT,true)
endif

# since 3.10 kernel
ifneq ($(filter-out 3.4, $(TARGET_LINUX_KERNEL_VERSION)),)
$(call soong_config_set,openmax,USE_DEFINE_H264_SEI_TYPE,true)
endif

# since 3.18 kernel
ifneq ($(filter-out 3.4 3.10, $(TARGET_LINUX_KERNEL_VERSION)),)
$(call soong_config_set,openmax,USE_ORIGINAL_HEADER,true)
$(call soong_config_set,openmax,USE_MFC_HEADER,true)
endif

# since 4.19 kernel
ifdef TARGET_LINUX_KERNEL_VERSION
KERNEL_VERSION_MAJOR := $(word 1,$(subst ., ,$(TARGET_LINUX_KERNEL_VERSION)))
KERNEL_VERSION_MINOR := $(word 2,$(subst ., ,$(TARGET_LINUX_KERNEL_VERSION)))
ifeq ($(shell expr $(KERNEL_VERSION_MAJOR) \> 4), 1)
$(call soong_config_set,openmax,MAINLINE_FEATURE_IN_SINCE_4_19,true)
else ifeq ($(shell expr $(KERNEL_VERSION_MAJOR) = 4), 1)
ifeq ($(shell expr $(KERNEL_VERSION_MINOR) \>= 19), 1)
$(call soong_config_set,openmax,MAINLINE_FEATURE_IN_SINCE_4_19,true)
endif
endif
endif


ifeq ($(BOARD_USE_HEVC_HWIP), true)
$(call soong_config_set,openmax,USE_HEVC_HWIP,true)
endif

ifeq ($(BOARD_USE_DEINTERLACING_SUPPORT), true)
$(call soong_config_set,openmax,USE_DEINTERLACING_SUPPORT,true)
endif

ifeq ($(BOARD_USE_SINGLE_PLANE_IN_DRM), true)
$(call soong_config_set,openmax,USE_SINGLE_PLANE_IN_DRM,true)
endif

ifneq ($(BOARD_USE_FRAMERATE_THRESH_HOLD),)
$(call soong_config_set,openmax,FRAMERATE_THRESH_HOLD,$(BOARD_USE_FRAMERATE_THRESH_HOLD))
endif

ifdef BOARD_EXYNOS_S10B_FORMAT_ALIGN
$(call soong_config_set,openmax,S10B_FORMAT_8B_ALIGNMENT,$(BOARD_EXYNOS_S10B_FORMAT_ALIGN))
endif

ifeq ($(BOARD_USE_DMA_BUF), true)
$(call soong_config_set,openmax,USE_DMA_BUF,true)
endif

ifeq ($(BOARD_USE_CSC_HW), true)
$(call soong_config_set,openmax,USE_CSC_HW,true)
endif

ifeq ($(BOARD_USE_NON_CACHED_GRAPHICBUFFER), true)
$(call soong_config_set,openmax,USE_NON_CACHED_GRAPHICBUFFER,true)
endif

ifdef BOARD_MFC_CHROMA_VALIGN
$(call soong_config_set,openmax,CHROMA_VALIGN,$(BOARD_MFC_CHROMA_VALIGN))
else
$(call soong_config_set,openmax,CHROMA_VALIGN,1)
endif

ifeq ($(BOARD_USE_WA_ION_BUF_REF), true)
$(call soong_config_set,openmax,USE_WA_ION_BUF_REF,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), 3)
$(call soong_config_set,openmax,USE_WA_ION_BUF_REF,true)
endif

ifeq ($(BOARD_OMX_USES_EPIC), true)
$(call soong_config_set,openmax,OMX_USES_EPIC,true)
endif

ifeq ($(BOARD_USES_EXYNOS_DATASPACE_FEATURE), true)
$(call soong_config_set,openmax,USE_BT709_SUPPORT,true)
endif

ifeq ($(BOARD_USES_EXYNOS_GRALLOC_VERSION), 0)
$(call soong_config_set,openmax,GRALLOC_VERSION0,true)
$(call soong_config_set,openmax,USE_PRIV_FORMAT,true)
else
$(call soong_config_set,openmax,USE_PRIV_USAGE,true)
endif

ifeq ($(BOARD_USE_SKYPE_HD), true)
$(call soong_config_set,openmax,USE_SKYPE_HD,true)
endif

ifeq ($(BOARD_USE_FULL_ST2094_40), true)
$(call soong_config_set,openmax,USE_FULL_ST2094_40,true)
$(call soong_config_set,exynos_headers_c2,full_st2094_40,true)
endif

ifeq ($(BOARD_USE_HDR10PLUS_STAT_ENC), true)
$(call soong_config_set,openmax,USE_HDR10PLUS_STAT_ENC,true)
endif

ifeq ($(BOARD_HAS_SCALER_ALIGN_RESTRICTION), true)
$(call soong_config_set,openmax,MSCL_EXT_SIZE,512)
else
$(call soong_config_set,openmax,MSCL_EXT_SIZE,0)
endif

ifeq ($(EXYNOS_OMX_SUPPORT_EGL_IMAGE), true)
$(call soong_config_set,openmax,EGL_IMAGE_SUPPORT,true)
endif

ifeq ($(EXYNOS_OMX_SUPPORT_TUNNELING), true)
$(call soong_config_set,openmax,TUNNELING_SUPPORT,true)
endif

ifneq ($(BOARD_NOT_SUPPORT_DCPP), true)
$(call soong_config_set,openmax,USE_SECURE_WITH_NONSECURE,true)
endif

ifeq ($(BOARD_USE_SINGLE_DRM), true)
$(call soong_config_set,openmax,USE_SINGLE_DRM,true)
endif

ifdef BOARD_USE_MAX_COMPONENT_NUM
$(call soong_config_set,openmax,MAX_COMPONENT_NUM,$(BOARD_USE_MAX_COMPONENT_NUM))
endif

ifeq ($(BOARD_USE_SMALL_SECURE_MEMORY), true)
$(call soong_config_set,openmax,USE_SMALL_SECURE_MEMORY,true)
endif

ifeq ($(BOARD_USE_COMPRESSED_COLOR), true)
$(call soong_config_set,openmax,USE_COMPRESSED_COLOR,true)
endif

ifeq ($(BOARD_USE_S3D_SUPPORT), true)
$(call soong_config_set,openmax,USE_S3D_SUPPORT,true)
endif

ifeq ($(BOARD_USE_CUSTOM_COMPONENT_SUPPORT), true)
$(call soong_config_set,openmax,USE_CUSTOM_COMPONENT_SUPPORT,true)
endif

ifeq ($(BOARD_USE_VP9DEC_SUPPORT), true)
$(call soong_config_set,openmax,USE_VP9DEC_SUPPORT,true)
endif

ifeq ($(BOARD_USE_GSC_RGB_ENCODER), true)
$(call soong_config_set,openmax,USE_HW_CSC_GRALLOC_SOURCE,true)
endif

ifeq ($(BOARD_USE_FIMC_RGB_ENCODER), true)
$(call soong_config_set,openmax,USE_FIMC_RGB_ENCODER,true)
endif


ifeq ($(BOARD_USE_VIDEO_EXT_FOR_WFD_HDCP), true)
$(call soong_config_set,openmax,USE_VIDEO_EXT_FOR_WFD_HDCP,true)
endif

ifeq ($(BOARD_USE_WFDENC_SUPPORT), true)
$(call soong_config_set,openmax,USE_WFDENC_SUPPORT,true)
endif

ifeq ($(BOARD_USE_HEVCENC_SUPPORT), true)
$(call soong_config_set,openmax,USE_HEVCENC_SUPPORT,true)
endif

ifeq ($(BOARD_USE_VP9ENC_SUPPORT), true)
$(call soong_config_set,openmax,USE_VP9ENC_SUPPORT,true)
endif

ifeq ($(BOARD_DISABLE_RAPID_COMPONENT_LOAD), true)
$(call soong_config_set,openmax,USE_DISABLE_RAPID_COMPONENT_LOAD,true)
endif

ifeq ($(BOARD_USE_NON_DRM_CODEC_ONLY), true)
$(call soong_config_set,openmax,USE_NON_DRM_CODEC_ONLY,true)
endif

ifeq ($(BOARD_USE_CSC_FILTER), true)
$(call soong_config_set,openmax,USE_CSC_FILTER,true)
endif

ifeq ($(BOARD_SUPPORT_MFC_ENC_RGB), true)
$(call soong_config_set,openmax,SUPPORT_MFC_ENC_RGB,true)
endif

ifeq ($(BOARD_USE_GDC), true)
$(call soong_config_set,openmax,USE_GDC,true)
endif

ifeq ($(BOARD_SUPPORT_MFC_ENC_BT2020), true)
$(call soong_config_set,openmax,SUPPORT_MFC_ENC_BT2020,true)
endif

ifdef BOARD_GPU_TYPE
$(call soong_config_set,openmax,GPU_TYPE,$(BOARD_GPU_TYPE))
endif

ifeq ($(BOARD_USE_DEC_SW_CSC), true)
$(call soong_config_set,openmax,USE_DEC_SW_CSC,true)
endif

ifeq ($(BOARD_USE_BLOB_ALLOCATOR), true)
$(call soong_config_set,openmax,USE_BLOB_ALLOCATOR,true)
endif

ifeq ($(BOARD_USE_QUERY_HDR2SDR), true)
$(call soong_config_set,openmax,USE_QUERY_HDR2SDR,true)
endif

ifdef BOARD_HDR_DYNAMIC_META_LIB
$(call soong_config_set,openmax,HDR_DYNAMIC_META_LIB,$(BOARD_HDR_DYNAMIC_META_LIB))
endif

ifeq ($(BOARD_HW_SUPPORT_FILMGRAIN), true)
$(call soong_config_set,openmax,USE_FILMGRAIN_FILTER,true)
endif

ifeq ($(BOARD_USE_SUPPORT_GPU_SBWC), true)
$(call soong_config_set,openmax,USE_SUPPORT_GPU_SBWC,true)
endif

ifeq ($(BOARD_USE_FLEXIBLE_P010), true)
$(call soong_config_set,openmax,USE_FLEXIBLE_P010,true)
endif
