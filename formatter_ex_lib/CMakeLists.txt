cmake_minimum_required(VERSION 3.10) 
project(formatter_ex)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex.cpp)
set(HEADERS ${CMAKE_CURRENT_SOURCE_DIR}//formatter_ex.h)

add_library(formatter_ex STATIC ${SOURCES} ${HEADERS})
target_include_directories(formatter_ex PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(formatter_ex formatter)
