# Church Countdown Timer - Installer Tools

## Single File Setup.exe (RECOMMENDED)

The easiest way to distribute the application is using the single-file setup.exe:

### For Developers:
Run `CreateSingleFileSetup.ps1` to generate `ChurchCountdownTimer_Setup.exe`

```powershell
powershell -ExecutionPolicy Bypass -File CreateSingleFileSetup.ps1
```

This creates a **single 62MB setup.exe file** that contains everything users need.

### For End Users:
1. **Download** `ChurchCountdownTimer_Setup.exe`
2. **Right-click** and select "Run as administrator"
3. **Follow** the installation prompts
4. **Enjoy** your countdown timer!

## Alternative Installation Methods

### Multi-File Installer (Legacy)
- **Install.bat** - Batch installer for multiple files
- **Setup.ps1** - PowerShell GUI installer

## What Gets Installed
- ✅ Main application in Program Files
- ✅ Desktop shortcut: "Church Countdown Timer"
- ✅ Start Menu entry
- ✅ Windows registry integration
- ✅ Uninstaller for clean removal

## System Requirements
- Windows 10 or Windows 11 (64-bit)
- Administrator privileges for installation
- .NET 8.0 Runtime (self-contained in installer)

## License
See `License.txt` for the software license agreement.

---
Church Countdown Timer v1.1.0 | Copyright © 2025 Church Timer App
