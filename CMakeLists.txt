cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(solver)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter)

add_executable(source ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)

target_link_libraries(source solver_lib)
target_link_libraries(source formatter_ex)
target_link_libraries(source formatter)

install(TARGETS source
RUNTIME DESTINATION bin
)

include(CPack.cmake)
