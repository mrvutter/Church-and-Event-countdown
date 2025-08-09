# Church & Event Countdown Timer

A professional countdown timer application designed for speakers, preachers, and event organizers. Features a large, easy-to-read display perfect for presentations and public speaking.

## ✨ Features

- **Large 800pt Font Display** - Maximum visibility from any distance
- **MM:SS Format** - Clean time formatting (shows MM:SS for times under 1 hour)
- **Fullscreen Mode** - Distraction-free presentation display
- **Simple Controls** - Start, Stop, Reset functionality
- **Self-Contained** - No installation required, runs on any Windows PC

## 🚀 Quick Start

### For Users (Easy Installation)
1. Download the latest release from [GitHub Releases](../../releases)
2. Extract `ChurchCountdownTimer_Ready_To_Install.zip`
3. Right-click `FullInstall.bat` and select "Run as administrator"
4. Use desktop shortcut or Start Menu to launch

### For Developers (Build from Source)
1. Clone this repository
2. Install [.NET 8.0 SDK](https://dotnet.microsoft.com/download)
3. Run `BuildAndDeploy.bat` to build the application
4. Run `CreateDistributionPackage.bat` to create the distribution ZIP

## 💻 System Requirements

- Windows 10/11 (32-bit or 64-bit)
- No .NET runtime required (self-contained deployment)
- Administrator privileges for installation only

## 🎯 Perfect For

- **Churches** - Sermon timing and service management
- **Conferences** - Speaker time management
- **Events** - Presentation timing
- **Public Speaking** - Professional timing displays
- **Workshops** - Session time tracking

## 🔧 Build Instructions

This project uses a build system to avoid storing large files in git:

1. **Prerequisites**: .NET 8.0 SDK
2. **Build**: `BuildAndDeploy.bat` - Creates self-contained deployment
3. **Package**: `CreateDistributionPackage.bat` - Creates distribution ZIP
4. **Distribute**: Share the generated ZIP file

## 📁 Project Structure

```
📁 ChurchCountdownTimer/              # Source code (.NET 8.0 WPF)
📁 ChurchCountdownTimer.Installer/    # Installation scripts and tools
📄 BuildAndDeploy.bat                 # Build the application locally
📄 CreateDistributionPackage.bat      # Create distribution ZIP
📦 ChurchCountdownTimer_Ready_To_Install.zip # Generated distribution package
```

> **Note**: Large deployment files are built locally and not stored in git. This keeps the repository lightweight while maintaining full functionality.

## 🛠️ Development

Built with:
- C# .NET 8.0
- WPF (Windows Presentation Foundation)
- Self-contained deployment for maximum compatibility

## 📄 License

This project is open source. See the license file for details.

---

**Ready to time your next presentation?** 
Download `ChurchCountdownTimer.exe` and start timing immediately! 🎯
