@echo off
:: Build and Deploy Script for Church Countdown Timer
:: This script builds the self-contained deployment locally to avoid storing large files in git

echo.
echo ==================================================
echo  Church Countdown Timer - Build and Deploy
echo ==================================================
echo.

:: Check if .NET SDK is installed
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: .NET SDK is not installed!
    echo Please install .NET 8.0 SDK from: https://dotnet.microsoft.com/download
    echo.
    pause
    exit /b 1
)

echo [1/4] Cleaning previous builds...
if exist "ChurchCountdownTimer.Installer\app" rmdir /s /q "ChurchCountdownTimer.Installer\app"
if exist "ChurchCountdownTimer.Installer\ChurchCountdownTimer.exe" del /f "ChurchCountdownTimer.Installer\ChurchCountdownTimer.exe"

echo [2/4] Building self-contained deployment...
cd ChurchCountdownTimer
dotnet publish -c Release -r win-x64 --self-contained true -o "..\ChurchCountdownTimer.Installer\app"
if errorlevel 1 (
    echo ERROR: Build failed!
    cd ..
    pause
    exit /b 1
)
cd ..

echo [3/4] Copying main executable...
copy "ChurchCountdownTimer.Installer\app\ChurchCountdownTimer.exe" "ChurchCountdownTimer.Installer\" >nul

echo [4/4] Creating uninstaller in app directory...
copy "ChurchCountdownTimer.Installer\UninstallTemplate.bat" "ChurchCountdownTimer.Installer\app\Uninstall.bat" >nul

echo.
echo ✅ BUILD COMPLETE!
echo.
echo The installer is now ready:
echo   • Run: ChurchCountdownTimer.Installer\FullInstall.bat
echo   • Or create distribution package with: CreateDistributionPackage.bat
echo.
pause
