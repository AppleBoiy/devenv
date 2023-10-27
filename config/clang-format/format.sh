#!/bin/bash

# Find all C++ source files recursively and format them with clang-format
find . -type f -name "*.cpp" -exec clang-format -style=file -i {} \;

