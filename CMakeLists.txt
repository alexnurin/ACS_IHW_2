cmake_minimum_required(VERSION 3.21)
project(ACS C)

set(CMAKE_C_STANDARD 99)

add_executable(ACS C_Files/main.c C_Files/input.c C_Files/combination.c)
