project(mlb-mobile-client)

cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 14)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Core REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Gui REQUIRED)

set(sources
    src/articles.cpp
    src/datacontroller.cpp
    src/main.cpp
    src/scheduleapi.cpp
    src/standings.cpp
    src/teamapi.cpp
    src/apibase.cpp
)
qt5_add_resources(rsc qml/qml.qrc)

add_executable(${PROJECT_NAME} ${sources} ${rsc})
target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra)
target_link_libraries(${PROJECT_NAME} Qt5::Qml Qt5::Gui)