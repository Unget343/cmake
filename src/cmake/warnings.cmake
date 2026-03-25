function(target_set_warnings TARGET enable as_errors)
    if (NOT ${ENABLED})
        message(STATUS "Warnings disabled for: ${target}")
        return()
    endif()

    set(MSVC_COMPILER /W4 /permissive-)

    set(CLANG_COMPILER -Wall -Wextra -Wpedantic)

    set(GCC_WARNINGS ${CLANG_WARNINGS})

    if (${AS_ERRORS})
        set(MSVC_WARNINGS ${MSVC_WARNINGS} /WX)
        set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
        set(GCC_WARNINGS ${GCC_WARNINGS} -Werror)
    endif()

    set(CXX_COMPILER ${CMAKE_CXX_COMPILER_ID})

    if(CXX_COMPILER MATCHES "MSVC")
        set(WARNINGS ${MSVC_WARNINGS})
    elseif(CXX_COMPILER MATCHES "clang")
        set(WARNINGS ${CLANG_WARNINGS})
    elseif(CXX_COMPILER MATCHES "GNU")
        set(WARNINGS ${GCC_WARNINGS})
    endif()

    target_compiler_options(${TARGET} PRIVATE ${WARNINGS})
    
endfunction()
