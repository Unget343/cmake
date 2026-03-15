cmake_minimum_required(VERSION 3.28)

project(CppProjectTemplate LANGUAGES C CXX VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

add_subdirectory(config)
add_subdirectory(lib)
add_subdirectory(app)
