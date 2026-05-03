@echo off
REM Script para compilar y correr en Windows

call build.bat
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Corriendo el juego...
    if exist build\sfml-2.6-template.exe (
        build\sfml-2.6-template.exe
    ) else if exist build\Debug\sfml-2.6-template.exe (
        build\Debug\sfml-2.6-template.exe
    ) else (
        echo No se encontró el ejecutable!
    )
)