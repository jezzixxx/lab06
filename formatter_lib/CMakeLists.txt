cmake_minimum_required(VERSION 3.10) 
project(formatter)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/formatter.cpp)
set(HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/formatter.h)
add_library(formatter STATIC ${SOURCES} ${HEADERS})

target_include_directories(formatter PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

