@echo off
REM Build script for Windows
REM Requirements: CMake and MinGW installed

echo ============================
echo Building SFML Game (Windows)
echo ============================

REM Configure CMake
echo Configuring...
cmake -S . -B build -G "MinGW Makefiles"
if %ERRORLEVEL% NEQ 0 (
    echo Configuration failed!
    pause
    exit /b %ERRORLEVEL%
)

REM Build
echo Building...
cmake --build build
if %ERRORLEVEL% NEQ 0 (
    echo Build failed!
    pause
    exit /b %ERRORLEVEL%
)

REM Copy DLLs
echo Copying DLLs...
if exist build\_deps\sfml-build\lib\*.dll (
    copy build\_deps\sfml-build\lib\*.dll build\ >nul 2>&1
)
if exist build\_deps\sfml-src\extlibs\bin\x64\openal32.dll (
    copy build\_deps\sfml-src\extlibs\bin\x64\openal32.dll build\ >nul 2>&1
)

echo ============================
echo Build successful!
echo Run with: build\sfml-game.exe
echo ============================
pause

