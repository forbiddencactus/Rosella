#SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
cmake_minimum_required(VERSION 3.13.4)
project (Rosella)

#add_subdirectory(llvm/llvm)

# From this tutorial: https://lowlevelbits.org/building-an-llvm-based-tool.-lessons-learned/
set(PATH_TO_LLVM "llvm/llvm")
if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${PATH_TO_LLVM}/CMakeLists.txt")

add_subdirectory(${PATH_TO_LLVM})

else()

message(FATAL_ERROR "FATAL: Could not find llvm!")

endif()

get_target_property(LLVM_INCLUDE_DIRS LLVMSupport INCLUDE_DIRECTORIES)
macro(get_llvm_version_component input component)
string(REGEX MATCH "${component} ([0-9]+)" match ${input})
  if (NOT match)
    message(FATAL_ERROR "Cannot find LLVM version component '${component}'")
  endif()
  set (${component} ${CMAKE_MATCH_1})
endmacro()

file(READ ${PATH_TO_LLVM}/CMakeLists.txt LLVM_CMAKELISTS)
get_llvm_version_component("${LLVM_CMAKELISTS}" LLVM_VERSION_MAJOR)
get_llvm_version_component("${LLVM_CMAKELISTS}" LLVM_VERSION_MINOR)
get_llvm_version_component("${LLVM_CMAKELISTS}" LLVM_VERSION_PATCH)
set (LLVM_VERSION ${LLVM_VERSION_MAJOR}.${LLVM_VERSION_MINOR}.${LLVM_VERSION_PATCH})


# Disable in-source builds to prevent source tree corruption.
if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "
FATAL: In-source builds are not allowed.
       You should create a separate directory for build files.
")
endif()

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

include_directories("Rosella")

# Source files...
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "Rosella/*.cpp" "Rosella/*.c")
add_executable(Rosella ${SOURCES})

#include_directories(${LLVM_INCLUDE_DIRS})
llvm_map_components_to_libnames(llvm_libs support core irreader)

# Link against LLVM libraries
target_link_libraries(Rosella ${llvm_libs})