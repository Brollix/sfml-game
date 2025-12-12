@echo off
REM Build and run script for Windows

call build.bat
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Running game...
    if exist build\sfml-game.exe (
        build\sfml-game.exe
    ) else if exist build\Debug\sfml-game.exe (
        build\Debug\sfml-game.exe
    ) else (
        echo Executable not found!
    )
)
pause
