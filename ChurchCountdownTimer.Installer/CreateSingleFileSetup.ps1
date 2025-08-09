# Simple Setup Creator for Church Countdown Timer
Write-Host "Creating single setup.exe..." -ForegroundColor Green

# Ensure we have the source files
$sourcePath = "..\ChurchCountdownTimer\ChurchTimer_Distribution_64bit"
if (!(Test-Path $sourcePath)) {
    Write-Host "Source files not found at: $sourcePath" -ForegroundColor Red
    exit 1
}

# Create temp directory and copy files
Write-Host "Preparing files..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "setup_temp" -Force | Out-Null
Copy-Item "$sourcePath\*" "setup_temp\" -Force

# Create a simple installer batch file
$installer = @'
@echo off
title Church Countdown Timer Setup

echo.
echo ==========================================
echo  Church Countdown Timer v1.1.0 Setup
echo ==========================================
echo.
echo Professional countdown timer for speakers and events
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required.
    echo Right-click and "Run as administrator"
    pause
    exit /b 1
)

set "INSTALL_DIR=%ProgramFiles%\Church Countdown Timer"

echo Creating directory: %INSTALL_DIR%
mkdir "%INSTALL_DIR%" 2>nul

echo Copying files...
copy "%~dp0ChurchCountdownTimer.exe" "%INSTALL_DIR%\" >nul
copy "%~dp0*.dll" "%INSTALL_DIR%\" >nul
copy "%~dp0*.pdb" "%INSTALL_DIR%\" >nul

echo Creating shortcuts...
powershell -Command "$s=New-Object -COM WScript.Shell;$sc=$s.CreateShortcut('%USERPROFILE%\Desktop\Church Countdown Timer.lnk');$sc.TargetPath='%INSTALL_DIR%\ChurchCountdownTimer.exe';$sc.Save()"

echo Registering application...
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Church Countdown Timer" /v "DisplayName" /t REG_SZ /d "Church Countdown Timer" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Church Countdown Timer" /v "DisplayVersion" /t REG_SZ /d "1.1.0" /f >nul

echo.
echo Installation complete!
echo Desktop shortcut: Church Countdown Timer
echo.
choice /C YN /M "Launch now"
if errorlevel 1 start "" "%INSTALL_DIR%\ChurchCountdownTimer.exe"
'@

$installer | Out-File "setup_temp\install.bat" -Encoding ASCII

# Create the ZIP
Write-Host "Creating archive..." -ForegroundColor Yellow
Compress-Archive -Path "setup_temp\*" -DestinationPath "setup_data.zip" -Force

# Create simple SFX
$sfx = @'
@echo off
title Church Countdown Timer Setup
echo Extracting...
set "TEMP_DIR=%TEMP%\ChurchTimer_%RANDOM%"
mkdir "%TEMP_DIR%"
powershell -Command "Expand-Archive -Path '%~dp0setup_data.zip' -DestinationPath '%TEMP_DIR%' -Force"
cd /d "%TEMP_DIR%"
call install.bat
cd /d "%TEMP%"
rmdir /s /q "%TEMP_DIR%" 2>nul
'@

$sfx | Out-File "extractor.bat" -Encoding ASCII

# Combine them
$extractorBytes = [System.IO.File]::ReadAllBytes("extractor.bat")
$zipBytes = [System.IO.File]::ReadAllBytes("setup_data.zip")
$finalBytes = $extractorBytes + $zipBytes
[System.IO.File]::WriteAllBytes("ChurchCountdownTimer_Setup.exe", $finalBytes)

# Cleanup
Remove-Item "setup_temp" -Recurse -Force
Remove-Item "setup_data.zip" -Force  
Remove-Item "extractor.bat" -Force

if (Test-Path "ChurchCountdownTimer_Setup.exe") {
    $size = (Get-Item "ChurchCountdownTimer_Setup.exe").Length
    Write-Host ""
    Write-Host "SUCCESS!" -ForegroundColor Green
    Write-Host "Created: ChurchCountdownTimer_Setup.exe ($([math]::Round($size/1MB,1)) MB)" -ForegroundColor White
    Write-Host ""
    Write-Host "This single file is ready for distribution!" -ForegroundColor Cyan
    Write-Host "Users just need to run it as administrator." -ForegroundColor Yellow
} else {
    Write-Host "Failed to create setup.exe" -ForegroundColor Red
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Green
