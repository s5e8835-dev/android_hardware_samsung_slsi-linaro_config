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
