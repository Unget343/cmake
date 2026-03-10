cmake_minimum_required(VERSION 3.28)

project(CppProjectTemplate LANGUAGES C CXX VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

option(COMPILER_EXECUTABLE "Whether to compile the executable" OFF)


add_subdirectory(lib)
if (COMPILER_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o exe. compiling")
endif()
