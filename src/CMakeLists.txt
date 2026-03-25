cmake_minimum_required(VERSION 3.28)

project(CppProjectTemplate LANGUAGES C CXX VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(USE_CPM "Whether to use CPM" OFF)
option(USE_CONAN "Enable to use Conan" ON)


set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

option(ENABLE_TESTING "Enable a unit testing build" OFF)
option(ENABLE_WARNINGS "Enable compiler warnings" ON)
option(WARNINGS_AS_ERRORS "Treat warnings as errors" ON)

option(ENABLE_ADDRESS_SANITIZE "Enable AddressSanitizer" ON)
option(ENABLE_UNDEFINED_SANITIZER "Enable undefined sanitixer" ON)

option(ENABLE_CLANG_TIDY "Enable clang-tidy" ON)
option(ENABLE_COVERAGE "Enable code coverage" ON)

option(ENABLE_LTO "ENABLE ..." ON)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmodule)
include(FetchContent)

if(ENABLE_WARNINGS)
    include(warnings)
endif()

if(ENABLE_ADDRESS_SANITIZE OR ENABLE_UNDEFINED_SANITIZER)
    include(sanitizer)
    add_sanitizer_flags()
endif()

if(ENABLE_LTO)
    include(LTO)
endif()

if(USE_CPM)
    include(CPM)
    cpmaddpackage("gh:nlohmann/json@3.11.2")
    cpmaddpackage("gh:fmtlib/fmt@8.1.1")
    cpmaddpackage("gh:gabime/spdlog@1.11.0")
    cpmaddpackage("gh:jarro2783/cxxopts@3.0.0")
elseif(USE_CONAN)
    include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

    find_package(nlohmann_json REQUIRED)
    find_package(fmt REQUIRED)
    find_package(spdlog REQUIRED)
    find_package(cxxopts REQUIRED)
endif()

add_subdirectory(external/json)
add_subdirectory(config)
add_subdirectory(lib)
add_subdirectory(app)
add_subdirectory(tests)

target_compile_definitions(${LIBRARY_NAME} PUBLIC PRINTER_ACTIVE)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(${LIBRARY_NAME} PRIVATE $<$<CONFIG:Debug>:/WX>)
endif()
