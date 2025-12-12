#!/bin/bash
# Build and run script for Linux

./build.sh
if [ $? -eq 0 ]; then
    echo ""
    echo "Running game..."
    ./build/sfml-game
fi

