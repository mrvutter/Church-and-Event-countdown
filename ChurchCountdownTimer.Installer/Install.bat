@echo off
title Church Countdown Timer Setup

echo.
echo ========================================
echo   Church Countdown Timer Setup v1.1.0
echo ========================================
echo.
echo This installer will install Church Countdown Timer
echo on your computer with the following features:
echo.
echo * Large, easy-to-read countdown display
echo * MM:SS format for readability
echo * Fullscreen mode without taskbar  
echo * Preset buttons for quick setup
echo * Custom time input functionality
echo * Professional appearance
echo.
echo Press any key to continue or close this window to cancel...
pause > nul

echo.
echo Starting installer...
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges...
    powershell.exe -ExecutionPolicy Bypass -File "%~dp0Setup.ps1"
) else (
    echo Requesting administrator privileges...
    powershell.exe -Command "Start-Process -FilePath 'powershell.exe' -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0Setup.ps1\"' -Verb RunAs"
)

echo.
echo Setup complete. Press any key to exit...
pause > nul
