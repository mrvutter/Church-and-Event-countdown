@echo off
:: Church Countdown Timer Uninstaller
:: This file gets copied to the app directory during build

echo.
echo ================================================
echo  Church Countdown Timer - Uninstaller
echo ================================================
echo.

:: Check for administrator privileges
net session >nul 2>&1
if errorlevel 1 (
    echo This uninstaller requires administrator privileges.
    echo Please run as administrator.
    pause
    exit /b 1
)

echo WARNING: This will completely remove Church Countdown Timer from your system.
echo.
set /p "confirm=Are you sure you want to uninstall? (y/N): "
if /i not "%confirm%"=="y" (
    echo Uninstall cancelled.
    pause
    exit /b 0
)

echo.
echo Removing Church Countdown Timer...

:: Remove desktop shortcut
if exist "%USERPROFILE%\Desktop\Church Countdown Timer.lnk" (
    del /f "%USERPROFILE%\Desktop\Church Countdown Timer.lnk"
    echo ✓ Desktop shortcut removed
)

:: Remove start menu shortcut
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Church Countdown Timer.lnk" (
    del /f "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Church Countdown Timer.lnk"
    echo ✓ Start menu shortcut removed
)

:: Remove registry entries for Add/Remove Programs
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /f >nul 2>&1
if not errorlevel 1 echo ✓ Registry entries removed

:: Create cleanup script that will delete the application folder and itself
set "cleanup_script=%TEMP%\cleanup_church_timer.bat"
echo @echo off > "%cleanup_script%"
echo timeout /t 2 /nobreak ^> nul >> "%cleanup_script%"
echo rmdir /s /q "C:\Program Files\Church Countdown Timer" >> "%cleanup_script%"
echo echo ✓ Application files removed >> "%cleanup_script%"
echo echo. >> "%cleanup_script%"
echo echo Church Countdown Timer has been completely uninstalled. >> "%cleanup_script%"
echo echo. >> "%cleanup_script%"
echo pause >> "%cleanup_script%"
echo del /f "%cleanup_script%" >> "%cleanup_script%"

echo ✓ Application folder will be removed shortly

:: Start cleanup script and exit
start "" "%cleanup_script%"
echo.
echo Uninstall completed successfully!
echo The application folder will be removed in a moment.
echo.

exit
