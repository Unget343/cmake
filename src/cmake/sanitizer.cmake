function(add_sanitizer_flags)
    if(NOT ${ENABLE_ADDRESS_SANITIZE} AND NOT ${ENABLE_UNDEFINED_SANITIZER})
        return()
    endif()

    set(CXX_COMPILER ${CMAKE_CXX_COMPILER_ID})

    if(CXX_COMPILER MATCHES "CLANG" OR CXX_COMPILER MATCHES "GNU")
        add_compile_options("-fno-omit-frame-pointer")
        add_link_options("-fno-omit-frame-pointer")

        if(${ENABLE_ADDRESS_SANITIZE})
            add_compile_options("-fsanitize=address")
            add_link_options("-fsanitize=address")
        endif()


        if(${ENABLE_UNDEFINED_SANITIZER})
            add_compile_options("-fsanitize=undefined")
            add_link_options("-fsanitize=undefined")
        endif()
    elseif(CXX_COMPILER MATCHES "MSVC")

         if(${ENABLE_ADDRESS_SANITIZE})
            add_compile_options("/fsanitize=address")
        endif()


        if(${ENABLE_UNDEFINED_SANITIZER})
         message(STATUS "undefined sanitizer not implemented for MSVC")
        endif()
    else()
        message(ERROR "Compiler not supported")
    endif()

endfunction()
