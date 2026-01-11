cmake_minimum_required(VERSION 3.16)

# Cpp Server Configuration
project(cpp_server)
set(nativerpc_DIR ../nativerpc/install/cmake)
find_package(nativerpc REQUIRED)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_BUILD_TYPE Debug)

# Cpp Server Executable
add_executable(
    main
    src/main.cpp
)
target_include_directories(
    main
    PUBLIC
    nativerpc::nativerpc
)
target_link_libraries(
    main
    PUBLIC
    nativerpc::nativerpc
)
set_target_properties(
    main PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/bin"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/bin"
)
add_custom_command(
    TARGET main
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1
    ${CMAKE_COMMAND} -E cmake_echo_color --no-newline "Status: " --green "Success"
)

# Cpp Server Dependencies
add_custom_command(
    TARGET main
    POST_BUILD
    COMMAND
        ${CMAKE_COMMAND}
        -E copy_if_different
        $<TARGET_FILE:nativerpc::cli>
        $<TARGET_FILE_DIR:main>
)
if(WIN32)
add_custom_command(
    TARGET main
    POST_BUILD
    COMMAND
    ${CMAKE_COMMAND}
    -E copy_if_different
    $<TARGET_FILE:nativerpc::nativerpc>
    $<TARGET_FILE_DIR:main>
)
endif()

# Cpp Server Info
get_target_property(NATIVERPC_INCL nativerpc::nativerpc INTERFACE_INCLUDE_DIRECTORIES)
add_custom_target(
    info
    COMMAND ${CMAKE_COMMAND} -E echo "Build Settings:"
    COMMAND ${CMAKE_COMMAND} -E echo "    Build Mode: ${CMAKE_BUILD_TYPE}"
    COMMAND ${CMAKE_COMMAND} -E echo "    C++ Standard: ${CMAKE_CXX_STANDARD}"
    COMMAND ${CMAKE_COMMAND} -E echo "    C++ Standard Required: ${CMAKE_CXX_STANDARD_REQUIRED}"
    COMMAND ${CMAKE_COMMAND} -E echo "    C++ Extensions: ${CMAKE_CXX_EXTENSIONS}"
    COMMAND ${CMAKE_COMMAND} -E echo "    External Dependencies: nativerpc-lib.lib, nativerpc-lib.dll"
    COMMAND ${CMAKE_COMMAND} -E echo "    External Includes: ${NATIVERPC_INCL}"
    COMMAND ${CMAKE_COMMAND} -E echo "    Build Tool: ${CMAKE_BUILD_TOOL}"
    COMMAND ${CMAKE_COMMAND} -E echo "    Lib Tool: ${CMAKE_AR}"
    COMMAND ${CMAKE_COMMAND} -E echo "    Source Dir: ${PROJECT_SOURCE_DIR}"
    COMMAND ${CMAKE_COMMAND} -E echo "    Build Dir: ${CMAKE_BINARY_DIR}"
    VERBATIM
)
