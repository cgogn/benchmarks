cmake_minimum_required(VERSION 3.7.2 FATAL_ERROR)

project(cgogn_benchmarks
	LANGUAGES CXX C
)

#### Default build type
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release")
endif()

set(CGOGN_BUILD_OR_INSTALL_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../CGoGN_2-build" CACHE PATH "CGoGN build or install dir")

#### Here are located the FindPackages that we need
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_BINARY_DIR}")


if(NOT CMAKE_RUNTIME_OUTPUT_DIRECTORY)
	  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
		  ${CMAKE_CURRENT_BINARY_DIR}/stage/${CMAKE_INSTALL_BINDIR})
  endif()
  if(NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
	  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY
		  ${CMAKE_CURRENT_BINARY_DIR}/stage/${CMAKE_INSTALL_LIBDIR})
  endif()
  if(NOT CMAKE_ARCHIVE_OUTPUT_DIRECTORY)
	  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY
		  ${CMAKE_CURRENT_BINARY_DIR}/stage/${CMAKE_INSTALL_LIBDIR})
endif()


if (EXISTS "${CGOGN_BUILD_OR_INSTALL_PATH}")
	list(APPEND CMAKE_PREFIX_PATH ${CGOGN_BUILD_OR_INSTALL_PATH})
endif()


set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)

include(cmake/google-benchmark.cmake)
fetch_google_benchmark(
	${PROJECT_SOURCE_DIR}/cmake
	${PROJECT_BINARY_DIR}/google-benchmark
)

set(CMAKE_CXX_STANDARD 11)

set(CGOGN_TEST_MESHES_PATH "${CMAKE_SOURCE_DIR}/data/meshes/")
add_definitions("-DCGOGN_TEST_MESHES_PATH=${CGOGN_TEST_MESHES_PATH}")

add_subdirectory(multithreading)
add_subdirectory(tri_map)
add_subdirectory(quad_map)
add_subdirectory(tetra_map)
add_subdirectory(comparison)
add_subdirectory(attributes)
add_subdirectory(eigen_map)
