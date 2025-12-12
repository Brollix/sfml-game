#!/bin/bash
# Build script for Linux
# Requirements: CMake, GCC/Clang, and system libraries (see README.md)

echo "============================"
echo "Building SFML Game (Linux)"
echo "============================"

# Configure CMake
echo "Configuring..."
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
if [ $? -ne 0 ]; then
    echo "Configuration failed!"
    exit 1
fi

# Build
echo "Building..."
cmake --build build
if [ $? -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi

echo "============================"
echo "Build successful!"
echo "Run with: ./build/sfml-game"
echo "============================"

