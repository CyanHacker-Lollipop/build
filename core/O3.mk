# Copyright (C) 2014-2015 The SaberMod Project
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

# Disable some modules that break with -O3
LOCAL_DISABLE_O3 := \
	libaudioflinger \
	libwebviewchromium \
	skia_skia_library_gyp \
    libopus	

O3_FLAGS := \
	-O3 \
	-Wno-error=array-bounds \
	-Wno-error=strict-overflow

ifneq (1,$(words $(filter $(LOCAL_DISABLE_O3),$(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += $(O3_FLAGS)
  else	
    LOCAL_CONLYFLAGS := $(O3_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += $(O3_FLAGS)
  else
    LOCAL_CPPFLAGS := $(O3_FLAGS)
  endif
endif