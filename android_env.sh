#!/bin/bash

#android_root_dir=/mnt/external/projects/android
android_root_dir=$HOME/Projects/android

export ANDROID_HOME=$android_root_dir/sdk/
export ANDROID_SDK_ROOT=$ANDROID_HOME

export ANDROID_TARGET_ABI=x86
export ANDROID_TARGET_ABI=armv7
export ANDROID_NDK_ROOT=$android_root_dir/ndk/android-ndk-r13b

function android_x86_qmake() {
     PATH=$android_root_dir/qt5/5.10.1/android_x86/bin/ qmake $@
}

function android_arm_qmake() {
     PATH=$android_root_dir/qt5/5.10.1/android_armv7/bin/ qmake $@
}

function android_build_apk() {
    arch=$1
    build_dir=$2
    make install INSTALL_ROOT=$build_dir
    $android_root_dir/qt5/5.10.1/android_$arch/bin/androiddeployqt --input android-libmobile-client.so-deployment-settings.json --output $build_dir --deployment bundled --gradle --verbose
}

function mlb_build_x86() {
    build_dir=/tmp/mlb-client-android-build-x86
    if [ -d $build_dir ]; then 
        /usr/bin/rm $build_dir -rf
    fi
    android_x86_qmake .. CONFIG+=debug
    make -j$(nproc)
    android_build_apk x86 $build_dir

    apk_file=$(find $build_dir -name *.apk)
    echo "APK File under $apk_file"
}

function mlb_build_arm() {
    build_dir=$(mktemp -d)
    android_arm_qmake .. CONFIG+=debug
    make -j$(nproc)
    android_build_apk armv7 $build_dir
}
