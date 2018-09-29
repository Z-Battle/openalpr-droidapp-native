# Copyright (C) 2009 The Android Open Source Project
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
LOCAL_PATH := $(call my-dir)
LIB_PATH := $(LOCAL_PATH)/../libs/armeabi-v7a

include $(CLEAR_VARS)

LOCAL_MODULE := jpg
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../tess2/tess-two/libs/armeabi-v7a/libjpgt.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := png
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../tess2/tess-two/libs/armeabi-v7a/libpngt.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := leptonica
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../tess2/tess-two/libs/armeabi-v7a/liblept.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := tesseract
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../tess2/tess-two/libs/armeabi-v7a/libtess.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := simpleini
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../openalpr/android-build/armeabi-v7a/openalpr/simpleini/libsimpleini.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := support
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../openalpr/android-build/armeabi-v7a/openalpr/support/libsupport.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := openalpr
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../openalpr/android-build/armeabi-v7a/openalpr/libopenalpr-static.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

OPENCV_INSTALL_MODULES:=on
OPENCV_CAMERA_MODULES:=off

include $(LOCAL_PATH)/../../OpenCV-android-sdk/sdk/native/jni/OpenCV.mk

LOCAL_MODULE := openalpr-native
SOURCE_LIST := $(wildcard $(LOCAL_PATH)/*.cpp)
HEADER_LIST := $(wildcard $(LOCAL_PATH)/*.h)
LOCAL_SRC_FILES += $(HEADER_LIST:$(LOCAL_PATH)/%=%)
LOCAL_SRC_FILES += $(SOURCE_LIST:$(LOCAL_PATH)/%=%)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../openalpr/src/openalpr
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../OpenCV-android-sdk/sdk/native/include
LOCAL_SHARED_LIBRARIES += tesseract leptonica png jpg
LOCAL_STATIC_LIBRARIES += openalpr support simpleini
LOCAL_LDLIBS := -llog

include $(BUILD_SHARED_LIBRARY)
