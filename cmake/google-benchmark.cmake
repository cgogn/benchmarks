
# the following code to fetch google-benchmark
# is inspired by and adapted after https://crascit.com/2015/07/25/cmake-gtest/
# download and unpack google-benchmark at configure time

macro(fetch_google_benchmark _download_module_path _download_root)
    set(GOOGLE_BENCHMARK_DOWNLOAD_ROOT ${_download_root})
    configure_file(
        ${_download_module_path}/google-benchmark-download.cmake.in
        ${_download_root}/CMakeLists.txt
        @ONLY
        )
    unset(GOOGLE_BENCHMARK_DOWNLOAD_ROOT)

    execute_process(
        COMMAND
            "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
        WORKING_DIRECTORY
            ${_download_root}
        )
    execute_process(
        COMMAND
            "${CMAKE_COMMAND}" --build .
        WORKING_DIRECTORY
            ${_download_root}
        )


    set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "" FORCE)

    add_subdirectory(
        ${_download_root}/google-benchmark-src
        ${_download_root}/google-benchmark-build
        )
endmacro()