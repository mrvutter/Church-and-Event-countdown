@echo off
title Church Countdown Timer Setup v1.1.0

echo.
echo ==========================================
echo  Church Countdown Timer v1.1.0 Setup
echo ==========================================
echo.
echo Professional countdown timer for speakers and events
echo Large display with MM:SS formatting
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [ERROR] Administrator privileges required.
    echo Please right-click this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

set "INSTALL_DIR=%ProgramFiles%\Church Countdown Timer"

echo Creating installation directory...
if exist "%INSTALL_DIR%" rmdir /s /q "%INSTALL_DIR%"
mkdir "%INSTALL_DIR%" 2>nul

echo Installing application files...
echo This may take a moment as we copy all required files...

REM Copy all application files
xcopy "%~dp0app\*" "%INSTALL_DIR%\" /E /H /Y >nul
if %errorLevel% neq 0 (
    echo [ERROR] Failed to copy application files
    pause
    exit /b 1
)

echo Creating desktop shortcut...
powershell -Command "$s=New-Object -COM WScript.Shell;$sc=$s.CreateShortcut('%USERPROFILE%\Desktop\Church Countdown Timer.lnk');$sc.TargetPath='%INSTALL_DIR%\ChurchCountdownTimer.exe';$sc.Description='Professional countdown timer for speakers and events';$sc.Save()" >nul

echo Creating start menu shortcut...
powershell -Command "$s=New-Object -COM WScript.Shell;$sc=$s.CreateShortcut('%ProgramData%\Microsoft\Windows\Start Menu\Programs\Church Countdown Timer.lnk');$sc.TargetPath='%INSTALL_DIR%\ChurchCountdownTimer.exe';$sc.Description='Professional countdown timer for speakers and events';$sc.Save()" >nul

echo Registering application in Programs and Features...
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "DisplayName" /t REG_SZ /d "Church Countdown Timer" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "DisplayVersion" /t REG_SZ /d "1.1.0" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "Publisher" /t REG_SZ /d "Church Timer Developer" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "InstallLocation" /t REG_SZ /d "%INSTALL_DIR%" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "UninstallString" /t REG_SZ /d "%INSTALL_DIR%\Uninstall.bat" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\ChurchCountdownTimer" /v "DisplayIcon" /t REG_SZ /d "%INSTALL_DIR%\ChurchCountdownTimer.exe" /f >nul

echo.
echo ==========================================
echo Installation completed successfully!
echo ==========================================
echo.
echo You can now run the timer from:
echo - Desktop shortcut: "Church Countdown Timer"
echo - Start menu: "Church Countdown Timer"
echo - Direct path: %INSTALL_DIR%\ChurchCountdownTimer.exe
echo.
echo To uninstall:
echo - Control Panel ^> Programs ^> Uninstall a program
echo - Or run: %INSTALL_DIR%\Uninstall.bat
echo.
echo Features:
echo - Large 800pt font display
echo - MM:SS time formatting
echo - Fullscreen presentation mode
echo - Works without internet connection
echo - All dependencies included
echo.
pause
