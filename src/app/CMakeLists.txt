set(EXE_SOURCES "main.cc")

add_executable(Executable ${EXE_SOURCES})
target_link_libraries(Executable PUBLIC
    Library
    nlohmann_json)
