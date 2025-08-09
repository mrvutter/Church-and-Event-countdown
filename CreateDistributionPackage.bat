@echo off
:: Create Distribution Package for Church Countdown Timer
:: This script creates a ZIP file ready for distribution

echo.
echo ========================================================
echo  Church Countdown Timer - Create Distribution Package
echo ========================================================
echo.

:: Check if app folder exists (built)
if not exist "ChurchCountdownTimer.Installer\app" (
    echo ERROR: Application not built yet!
    echo Please run BuildAndDeploy.bat first.
    echo.
    pause
    exit /b 1
)

:: Check if PowerShell is available for compression
powershell -Command "Get-Command Compress-Archive" >nul 2>&1
if errorlevel 1 (
    echo ERROR: PowerShell with Compress-Archive is required
    echo Please ensure you have Windows 10 or newer, or PowerShell 5.0+
    echo.
    pause
    exit /b 1
)

echo [1/2] Preparing distribution files...
if exist "ChurchCountdownTimer_Ready_To_Install.zip" del /f "ChurchCountdownTimer_Ready_To_Install.zip"

echo [2/2] Creating distribution package...
powershell -Command "Compress-Archive -Path 'ChurchCountdownTimer.Installer\*' -DestinationPath 'ChurchCountdownTimer_Ready_To_Install.zip' -CompressionLevel Optimal"

if exist "ChurchCountdownTimer_Ready_To_Install.zip" (
    echo.
    echo ✅ DISTRIBUTION PACKAGE CREATED!
    echo.
    echo File: ChurchCountdownTimer_Ready_To_Install.zip
    for %%A in ("ChurchCountdownTimer_Ready_To_Install.zip") do echo Size: %%~zA bytes
    echo.
    echo This package contains:
    echo   • Complete self-contained application
    echo   • Professional installer with registry integration
    echo   • Built-in uninstaller accessible via Control Panel
    echo   • All required dependencies included
    echo.
    echo Ready for distribution! 🎉
) else (
    echo ERROR: Failed to create distribution package
    exit /b 1
)

echo.
pause
