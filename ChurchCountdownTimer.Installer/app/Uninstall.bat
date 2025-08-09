@echo off
title Uninstall Church Countdown Timer

echo.
echo ==========================================
echo  Church Countdown Timer - Uninstaller
echo ==========================================
echo.

set /p confirm="Are you sure you want to uninstall Church Countdown Timer? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Uninstall cancelled.
    pause
    exit /b 0
)

echo.
echo Checking administrator privileges...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [ERROR] Administrator privileges required.
    echo Please right-click this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo.
echo Uninstalling Church Countdown Timer...

echo Removing desktop shortcut...
if exist "%USERPROFILE%\Desktop\Church Countdown Timer.lnk" (
    del "%USERPROFILE%\Desktop\Church Countdown Timer.lnk"
    echo - Desktop shortcut removed
) else (
    echo - Desktop shortcut not found
)

echo Removing start menu shortcut...
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Church Countdown Timer.lnk" (
    del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Church Countdown Timer.lnk"
    echo - Start menu shortcut removed
) else (
    echo - Start menu shortcut not found
)

echo Removing registry entries...
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo - Registry entries removed
) else (
    echo - Registry entries not found or already removed
)

echo Removing application files...
cd /d "%TEMP%"
timeout /t 2 /nobreak >nul

REM Create a self-deleting batch file to remove the installation directory
echo @echo off > "%TEMP%\cleanup_church_timer.bat"
echo timeout /t 3 /nobreak ^>nul >> "%TEMP%\cleanup_church_timer.bat"
echo rmdir /s /q "%ProgramFiles%\Church Countdown Timer" >> "%TEMP%\cleanup_church_timer.bat"
echo if exist "%ProgramFiles%\Church Countdown Timer" ( >> "%TEMP%\cleanup_church_timer.bat"
echo     echo Failed to remove some files. Please manually delete: >> "%TEMP%\cleanup_church_timer.bat"
echo     echo "%ProgramFiles%\Church Countdown Timer" >> "%TEMP%\cleanup_church_timer.bat"
echo     pause >> "%TEMP%\cleanup_church_timer.bat"
echo ^) else ( >> "%TEMP%\cleanup_church_timer.bat"
echo     echo Application files removed successfully. >> "%TEMP%\cleanup_church_timer.bat"
echo ^) >> "%TEMP%\cleanup_church_timer.bat"
echo del "%%~f0" >> "%TEMP%\cleanup_church_timer.bat"

echo.
echo ==========================================
echo Uninstall completed successfully!
echo ==========================================
echo.
echo Church Countdown Timer has been removed from your system.
echo.
echo Thank you for using Church Countdown Timer!
echo.
pause

REM Start the cleanup script and exit
start "" "%TEMP%\cleanup_church_timer.bat"
exit
