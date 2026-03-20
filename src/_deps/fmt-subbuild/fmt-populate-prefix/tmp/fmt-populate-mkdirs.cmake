# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspaces/thread-1/src/_deps/fmt-src"
  "/workspaces/thread-1/src/_deps/fmt-build"
  "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix"
  "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/tmp"
  "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp"
  "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/src"
  "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/thread-1/src/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
