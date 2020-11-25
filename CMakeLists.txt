cmake_minimum_required (VERSION 3.6)
project(fdiscord Fortran CXX)

include_directories(${PROJECT_BINARY_DIR})

add_library(
    fdiscord
    SHARED
    fdiscord.f90
)