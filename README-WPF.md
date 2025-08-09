# Church Countdown Timer - WPF Desktop Application

A professional WPF countdown timer application designed for speakers, preachers, and event organizers.

## ✅ **Current Status: FULLY FUNCTIONAL**

This timer application is complete and ready for use with all requested features implemented.

## 🎯 **Features**

- **Large Display**: FontSize 800 for easy visibility from distance
- **Smart Formatting**: MM:SS format for times under an hour, HH:MM:SS for longer times
- **Fullscreen Mode**: Hides taskbar for distraction-free presentation
- **Smooth Animations**: Fade effects for professional appearance
- **Quick Presets**: 5, 10, and 15-minute buttons for common church service needs
- **Custom Time Input**: Set any time duration
- **Start/Stop/Reset**: Full timer control

## 📥 **Downloads**

### Self-Contained Executables (No .NET installation required)

- **Windows 64-bit**: [ChurchCountdownTimer-x64.exe](ChurchCountdownTimer/publish/win-x64/ChurchCountdownTimer.exe) (154.4 MB)
- **Windows 32-bit**: [ChurchCountdownTimer-x86.exe](ChurchCountdownTimer/publish/win-x86/ChurchCountdownTimer.exe) (144.1 MB)

## 💻 **System Requirements**

- Windows 10/11 (64-bit or 32-bit)
- No additional software required (self-contained)

## 🚀 **Usage**

1. Download the appropriate version for your system
2. Run the executable file
3. Enter time in MM:SS format (e.g., 05:00 for 5 minutes)
4. Use preset buttons for quick selection
5. Press F11 for fullscreen mode
6. Press Escape to exit fullscreen

## 🛠 **Technical Details**

- **Built with**: C# WPF (.NET 8.0)
- **Framework**: Windows Desktop
- **License**: Open Source
- **Version**: 1.1.0
- **Build Status**: ✅ Working perfectly

## 🔧 **Development**

This project is built using .NET 8.0 and WPF. To build from source:

```bash
git clone [repository-url]
cd 100x/ChurchCountdownTimer
dotnet build
dotnet run
```

To publish:
```bash
# 64-bit
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true

# 32-bit  
dotnet publish -c Release -r win-x86 --self-contained -p:PublishSingleFile=true
```

## 📁 **Project Structure**

```
ChurchCountdownTimer/
├── MainWindow.xaml          # UI layout and styling
├── MainWindow.xaml.cs       # Timer logic and functionality
├── ChurchCountdownTimer.csproj  # Project configuration
├── publish/
│   ├── win-x64/            # 64-bit executable
│   └── win-x86/            # 32-bit executable
└── README.md
```

## 🎯 **Perfect For**

- Church services and sermons
- Speaking events and conferences
- Presentations and workshops
- Any timed activity needing visible countdown

## 🤝 **Contributing**

Feel free to submit issues and enhancement requests!
