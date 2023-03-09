cmake_minimum_required(VERSION 3.4)
project(hello_world)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter)

add_executable(source hello_world.cpp)

target_link_libraries(source formatter_ex)
target_link_libraries(source formatter)
