@echo off
REM Script para compilar y correr en Windows

call build.bat
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Corriendo el juego...
    if exist build\sfml-game.exe (
        build\sfml-game.exe
    ) else if exist build\Debug\sfml-game.exe (
        build\Debug\sfml-game.exe
    ) else (
        echo No se encontró el ejecutable!
    )
)