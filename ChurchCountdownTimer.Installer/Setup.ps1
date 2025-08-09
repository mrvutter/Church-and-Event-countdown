# Church Countdown Timer Self-Extracting Installer
# PowerShell Script with GUI Installer

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Application Information
$AppName = "Church Countdown Timer"
$AppVersion = "1.1.0"
$Publisher = "Church Timer App"
$InstallPath = "$env:ProgramFiles\$AppName"

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "$AppName Setup"
$form.Size = New-Object System.Drawing.Size(500,400)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# Welcome Label
$welcomeLabel = New-Object System.Windows.Forms.Label
$welcomeLabel.Location = New-Object System.Drawing.Point(20,20)
$welcomeLabel.Size = New-Object System.Drawing.Size(450,40)
$welcomeLabel.Text = "Welcome to the $AppName Setup Wizard"
$welcomeLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,[System.Drawing.FontStyle]::Bold)
$form.Controls.Add($welcomeLabel)

# Description Label
$descLabel = New-Object System.Windows.Forms.Label
$descLabel.Location = New-Object System.Drawing.Point(20,70)
$descLabel.Size = New-Object System.Drawing.Size(450,60)
$descLabel.Text = "This will install $AppName $AppVersion on your computer.`n`nProfessional countdown timer for speakers, preachers, and event organizers."
$form.Controls.Add($descLabel)

# License Agreement
$licenseLabel = New-Object System.Windows.Forms.Label
$licenseLabel.Location = New-Object System.Drawing.Point(20,140)
$licenseLabel.Size = New-Object System.Drawing.Size(450,20)
$licenseLabel.Text = "License Agreement:"
$licenseLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9,[System.Drawing.FontStyle]::Bold)
$form.Controls.Add($licenseLabel)

$licenseText = New-Object System.Windows.Forms.TextBox
$licenseText.Location = New-Object System.Drawing.Point(20,165)
$licenseText.Size = New-Object System.Drawing.Size(450,120)
$licenseText.Multiline = $true
$licenseText.ScrollBars = "Vertical"
$licenseText.ReadOnly = $true
$licenseText.Text = @"
CHURCH COUNTDOWN TIMER SOFTWARE LICENSE AGREEMENT

This software is provided "AS IS" without warranty of any kind. You may install and use this software freely. By clicking Install, you agree to these terms.

Features:
• Large, easy-to-read countdown display
• MM:SS format for readability  
• Fullscreen mode without taskbar
• Preset buttons for quick setup
• Custom time input
• Professional appearance

Copyright © 2025 Church Timer App. All rights reserved.
"@
$form.Controls.Add($licenseText)

# Installation Path
$pathLabel = New-Object System.Windows.Forms.Label
$pathLabel.Location = New-Object System.Drawing.Point(20,295)
$pathLabel.Size = New-Object System.Drawing.Size(100,20)
$pathLabel.Text = "Install Location:"
$form.Controls.Add($pathLabel)

$pathTextBox = New-Object System.Windows.Forms.TextBox
$pathTextBox.Location = New-Object System.Drawing.Point(120,293)
$pathTextBox.Size = New-Object System.Drawing.Size(300,20)
$pathTextBox.Text = $InstallPath
$form.Controls.Add($pathTextBox)

$browseButton = New-Object System.Windows.Forms.Button
$browseButton.Location = New-Object System.Drawing.Point(425,292)
$browseButton.Size = New-Object System.Drawing.Size(45,23)
$browseButton.Text = "..."
$browseButton.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Select installation folder"
    $folderBrowser.SelectedPath = $pathTextBox.Text
    if ($folderBrowser.ShowDialog() -eq "OK") {
        $pathTextBox.Text = Join-Path $folderBrowser.SelectedPath $AppName
    }
})
$form.Controls.Add($browseButton)

# Buttons
$installButton = New-Object System.Windows.Forms.Button
$installButton.Location = New-Object System.Drawing.Point(300,330)
$installButton.Size = New-Object System.Drawing.Size(80,30)
$installButton.Text = "Install"
$installButton.BackColor = [System.Drawing.Color]::LightGreen
$installButton.Add_Click({
    try {
        $targetPath = $pathTextBox.Text
        
        # Create installation directory
        if (!(Test-Path $targetPath)) {
            New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
        }
        
        # Copy files from distribution folder
        $sourcePath = Join-Path $PSScriptRoot "..\ChurchCountdownTimer\ChurchTimer_Distribution_64bit"
        if (Test-Path $sourcePath) {
            Copy-Item -Path "$sourcePath\*" -Destination $targetPath -Recurse -Force
            
            # Create desktop shortcut
            $shell = New-Object -ComObject WScript.Shell
            $shortcut = $shell.CreateShortcut("$env:USERPROFILE\Desktop\$AppName.lnk")
            $shortcut.TargetPath = Join-Path $targetPath "ChurchCountdownTimer.exe"
            $shortcut.WorkingDirectory = $targetPath
            $shortcut.Description = "Professional countdown timer for speakers and events"
            $shortcut.Save()
            
            # Create start menu shortcut
            $startMenuPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
            $startMenuShortcut = $shell.CreateShortcut("$startMenuPath\$AppName.lnk")
            $startMenuShortcut.TargetPath = Join-Path $targetPath "ChurchCountdownTimer.exe"
            $startMenuShortcut.WorkingDirectory = $targetPath
            $startMenuShortcut.Description = "Professional countdown timer for speakers and events"
            $startMenuShortcut.Save()
            
            # Add to Programs and Features
            $regPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$AppName"
            New-Item -Path $regPath -Force | Out-Null
            Set-ItemProperty -Path $regPath -Name "DisplayName" -Value $AppName
            Set-ItemProperty -Path $regPath -Name "DisplayVersion" -Value $AppVersion
            Set-ItemProperty -Path $regPath -Name "Publisher" -Value $Publisher
            Set-ItemProperty -Path $regPath -Name "InstallLocation" -Value $targetPath
            Set-ItemProperty -Path $regPath -Name "UninstallString" -Value "powershell.exe -ExecutionPolicy Bypass -File `"$targetPath\Uninstall.ps1`""
            
            # Create uninstaller
            $uninstallScript = @"
# Uninstaller for $AppName
`$appName = "$AppName"
`$installPath = "$targetPath"

# Remove shortcuts
Remove-Item "`$env:USERPROFILE\Desktop\`$appName.lnk" -ErrorAction SilentlyContinue
Remove-Item "`$env:APPDATA\Microsoft\Windows\Start Menu\Programs\`$appName.lnk" -ErrorAction SilentlyContinue

# Remove registry entry
Remove-Item "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\`$appName" -Force -ErrorAction SilentlyContinue

# Remove files
Remove-Item `$installPath -Recurse -Force -ErrorAction SilentlyContinue

[System.Windows.Forms.MessageBox]::Show("`$appName has been successfully uninstalled.", "Uninstall Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
"@
            $uninstallScript | Out-File -FilePath (Join-Path $targetPath "Uninstall.ps1") -Encoding UTF8
            
            [System.Windows.Forms.MessageBox]::Show("$AppName has been successfully installed!`n`nShortcuts created on Desktop and Start Menu.", "Installation Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            $form.Close()
        } else {
            [System.Windows.Forms.MessageBox]::Show("Source files not found. Please ensure the distribution folder exists.", "Installation Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Installation failed: $($_.Exception.Message)", "Installation Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})
$form.Controls.Add($installButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(390,330)
$cancelButton.Size = New-Object System.Drawing.Size(80,30)
$cancelButton.Text = "Cancel"
$cancelButton.Add_Click({ $form.Close() })
$form.Controls.Add($cancelButton)

# Show the form
$form.ShowDialog() | Out-Null
