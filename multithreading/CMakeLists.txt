cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(bench_multithreading
	LANGUAGES CXX
)

find_package(cgogn_core REQUIRED)
find_package(cgogn_io REQUIRED)
find_package(cgogn_geometry REQUIRED)
find_package(benchmark REQUIRED)

add_executable(${PROJECT_NAME} bench_multithreading.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/thirdparty/google-benchmark/include)
target_link_libraries(${PROJECT_NAME} cgogn::core cgogn::io cgogn::geometry benchmark)

set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER benchmarks)
