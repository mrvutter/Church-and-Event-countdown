# Church Countdown Timer - C# WPF Desktop Application

A professional Windows desktop application designed specifically for church services, events, and speaking engagements. This countdown timer helps speakers, preachers, and event organizers manage their time effectively with a clean, distraction-free interface.

## ✨ Features

### ⏰ **Timer Functionality**
- **Flexible Time Input**: Set hours, minutes, and seconds with validated input fields
- **Quick Presets**: Common durations (5min, 10min, 15min, 20min, 30min, 45min, 1hour)
- **Smart Display**: Shows hours only when needed, otherwise shows minutes:seconds format
- **Real-time Countdown**: Large, clear display perfect for stage visibility

### 🎨 **Complete Customization**
- **Timer Color Picker**: Choose any color for the countdown text
- **Background Color Picker**: Select background colors optimized for different lighting
- **Professional Color Dialog**: Full Windows color picker integration
- **Live Preview**: See color changes immediately in the setup screen

### 🖥️ **Two-Screen Design**
- **Setup Screen**: Professional input interface with all controls and customization
- **Fullscreen Timer**: Clean, distraction-free countdown display
- **Automatic Fullscreen**: Enters fullscreen mode when timer starts
- **Easy Return**: Simple button to return to setup screen

### ⚡ **Smart Controls**
- **Fade-Out Interface**: Controls disappear after 5 seconds to avoid speaker distraction
- **Mouse Activation**: Move mouse to temporarily show controls
- **Return Button**: Exit fullscreen and return to setup screen
- **+5 Minutes Button**: Quickly add time during presentations
- **Keyboard Shortcuts**: 
  - **Escape**: Return to setup screen
  - **A**: Add 5 minutes
  - **Space**: Pause/Resume timer

### 🔔 **Visual & Audio Alerts**
- **Warning Indicator**: Orange flashing when 1 minute or less remains
- **Time's Up Alert**: Red flashing display and system sound
- **Message Box**: Clear "Time's Up!" notification
- **Automatic Control Show**: Controls reappear when timer finishes

## 🛠️ Installation & Setup

### **Prerequisites**
- **Windows 10/11** (64-bit recommended)
- **.NET 8.0 Runtime** (automatically installed with the app)

### **Building from Source**
```bash
# Navigate to the project directory
cd ChurchCountdownTimer

# Build the application
dotnet build

# Run the application
dotnet run

# Create a distributable executable
dotnet publish -c Release -r win-x64 --self-contained
```

## 🎯 How to Use

### **Setting Up Your Timer**
1. **Launch the application** - starts on the setup screen
2. **Enter your time** using the Hours, Minutes, and Seconds input fields
3. **Choose colors**:
   - Click timer color button to select countdown text color
   - Click background color button to select background
4. **Use quick presets** for common durations
5. **Click "Start Timer"** to begin

### **During the Presentation**
- Timer automatically enters fullscreen mode
- Large countdown display visible from distance
- Controls fade out after 5 seconds (no speaker distraction)
- Move mouse to temporarily show controls
- Warning appears when 1 minute remains
- Clear alerts when time is up

### **Managing the Timer**
- **Return Button**: Exit fullscreen and return to setup
- **+5 Min Button**: Add 5 minutes to current timer
- **Keyboard shortcuts** for quick control without mouse

## 🏛️ Perfect for Church & Events

### **Church Services**
- **Sermon Timing**: Help pastors manage message time
- **Prayer Segments**: Time opening, closing, and special prayers
- **Worship Periods**: Manage music and worship duration
- **Sunday School**: Keep lessons on schedule
- **Special Events**: Time testimonies, announcements, etc.

### **Speaking Events**
- **Conference Presentations**: Professional timing for speakers
- **Workshop Sessions**: Break sessions into timed segments
- **Q&A Periods**: Allocate specific time for audience questions
- **Panel Discussions**: Keep panelists within time limits

### **Educational Settings**
- **Lecture Timing**: Keep academic presentations on track
- **Exam Periods**: Visual countdown for test duration
- **Presentation Practice**: Help students manage speaking time

## 🎨 Color Recommendations

### **High Contrast (Distance Viewing)**
- **Timer**: White or Yellow
- **Background**: Black or Dark Blue

### **Stage Lighting**
- **Timer**: Bright Yellow or Orange
- **Background**: Dark Gray or Black

### **Daylight/Well-Lit Rooms**
- **Timer**: Dark Blue or Black
- **Background**: White or Light Gray

### **Evening Services**
- **Timer**: Warm White or Gold
- **Background**: Dark Brown or Navy

## ⌨️ Keyboard Shortcuts

| Key | Action |
|-----|--------|
| **Escape** | Return to setup screen |
| **Space** | Pause/Resume timer |
| **A** | Add 5 minutes |
| **Mouse Movement** | Show controls temporarily |

## 📋 Technical Specifications

### **Built With**
- **C# & WPF**: Modern Windows desktop framework
- **.NET 8.0**: Latest Microsoft framework
- **Windows Forms Integration**: Professional color picker dialogs
- **XAML**: Responsive and scalable UI design

### **System Requirements**
- **Operating System**: Windows 10 version 1809 or later
- **Architecture**: x64 (64-bit)
- **Memory**: 100MB RAM
- **Storage**: 50MB available disk space
- **Display**: Any resolution (optimized for 1080p and higher)

### **Performance Features**
- **Native Windows Application**: Fast startup and smooth performance
- **Low Resource Usage**: Minimal CPU and memory footprint
- **Hardware Acceleration**: Smooth animations and transitions
- **Responsive UI**: Instant response to user input

## 🔧 Customization & Settings

### **Automatic Settings Persistence**
- Color preferences are automatically saved
- Last used timer values are remembered
- Window size and position restored

### **Professional Design**
- Modern, clean interface following Windows design guidelines
- Accessibility-friendly with high contrast support
- Scalable fonts and UI elements
- Professional animations and transitions

## 🎬 Usage Scenarios

### **Sunday Morning Service**
1. Set 45-minute sermon timer with yellow text on black background
2. Pastor can see timer from pulpit
3. +5 minute button for extended invitation
4. Clear alerts when time is up

### **Conference Presentation**
1. Set 20-minute presentation timer
2. Professional colors matching event branding
3. Speaker controls without audience distraction
4. Smooth transition back to setup for next speaker

### **Youth Group Activity**
1. Set 15-minute activity timer
2. Bright, fun colors to engage participants
3. Clear visual countdown everyone can see
4. Quick setup for multiple timed activities

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Professional countdown timing for churches, conferences, and speaking events - built with reliability and ease of use in mind!**
