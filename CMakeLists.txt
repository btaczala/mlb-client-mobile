project(mlb-mobile-client)

cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 14)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Core REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Svg REQUIRED)
find_package(Qt5Xml REQUIRED)

set(sources
    src/articles.cpp
    src/datacontroller.cpp
    src/main.cpp
    src/scheduleapi.cpp
    src/standings.cpp
    src/teamapi.cpp
    src/apibase.cpp
    src/playersapi.cpp
)
qt5_add_resources(rsc qml/qml.qrc)
qt5_add_resources(dummy_rsc dummydata.qrc)


if(ANDROID)
    list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
    include(AddQtAndroidApk)
    add_library(${PROJECT_NAME} SHARED ${sources} ${rsc} ${dummy_rsc})

    # variables for AddQtAndroidApk
    set(ANDROID_ABI ${CMAKE_ANDROID_ARCH_ABI})
    set(ANDROID_TOOLCHAIN_MACHINE_NAME ${ANDROID_ABI})
    if ("${ANDROID_ABI}" STREQUAL "armeabi")
        set(ANDROID_TOOLCHAIN_MACHINE_NAME "arm-linux-androideabi")
        set(ANDROID_TOOLCHAIN_PREFIX "arm-linux-androideabi")
    elseif("${ANDROID_ABI}" STREQUAL "x86")
        set(ANDROID_TOOLCHAIN_PREFIX "i686-linux-android")
    endif()
    set(ANDROID_COMPILER_VERSION "4.9")
    set(ANDROID_NDK_HOST_SYSTEM_NAME "linux-x86_64")
    set(ANDROID_STL_PATH "${CMAKE_ANDROID_NDK}/sources/cxx-stl/gnu-libstdc++/4.9/libs/x86/lib${CMAKE_ANDROID_STL_TYPE}.so")
    add_qt_android_apk(${PROJECT_NAME}_apk ${PROJECT_NAME}
        BUILDTOOLS_REVISION "28.0.0-rc1"
    )

else()
    add_executable(${PROJECT_NAME} ${sources} ${rsc} ${dummy_rsc})
endif()

target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra)
target_link_libraries(${PROJECT_NAME} Qt5::Qml Qt5::Gui Qt5::Core Qt5::Widgets Qt5::Quick Qt5::Xml)
