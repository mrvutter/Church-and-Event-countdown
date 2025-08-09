# Church Countdown Timer - Desktop Application

A professional desktop application designed specifically for church services, events, and speaking engagements. This fullscreen countdown timer helps speakers, preachers, and event organizers manage their time effectively with a clean, distraction-free interface.

## 🎯 **User Requirements Summary**

### **Core Functionality**
- **Timer Input**: Hours, minutes, and seconds input fields
- **Smart Display**: Shows hours only when needed, otherwise shows minutes:seconds format
- **Two-Part Interface**:
  1. **Setup Screen**: Input timer settings and customize appearance
  2. **Fullscreen Timer**: Clean countdown display without distractions

### **Design Requirements**
- **Font**: Inter font family with letter spacing -0.05em (-5)
- **No Shadows**: Clean, modern appearance without text shadows
- **Minimal Controls**: Only essential buttons during fullscreen countdown
- **Auto-Hide Controls**: Buttons fade out after timer starts to avoid speaker distraction

### **Essential Controls**
- **Return Button**: Go back to setup screen (should exit fullscreen properly)
- **Add Time Button**: Add 5 minutes to current timer
- **Color Customization**: Timer text color and background color pickers (in setup screen only)

### **User Experience**
- **Application Start**: Must always start on setup screen where user inputs timer
- **Fullscreen Experience**: Clean, professional display suitable for church/event environments
- **Speaker-Friendly**: No distracting UI elements during presentations
- **Professional Appearance**: Suitable for formal church and event settings

## 🚨 **Current Issues to Resolve**

1. **Startup Problem**: Application starts on timer screen instead of setup screen
2. **Return Button**: Makes screen fullscreen instead of returning to setup
3. **Add Time Button**: Not functioning properly
4. **Screen Management**: Improper switching between setup and timer screens

## 💡 **Recommended Technology Stack**

Given the requirements for a robust PC desktop application, the following technologies would be more suitable:

### **Option 1: C# with WPF (Recommended)**
- **Advantages**: Native Windows application, excellent fullscreen support, robust UI framework
- **Technologies**: C# .NET, WPF (Windows Presentation Foundation)
- **Benefits**: Better window management, native Windows integration, easier deployment

### **Option 2: C# with WinUI 3**
- **Advantages**: Modern Windows app platform, excellent performance
- **Technologies**: C# .NET, WinUI 3
- **Benefits**: Latest Microsoft UI framework, future-proof

### **Option 3: Python with Tkinter/PyQt**
- **Advantages**: Rapid development, cross-platform
- **Technologies**: Python, Tkinter or PyQt
- **Benefits**: Simpler development, good for prototyping

## 🎨 **Design Specifications**

### **Typography**
- **Font Family**: Inter
- **Letter Spacing**: -0.05em (-5)
- **Timer Display**: Large, clean numbers for distance visibility
- **No Text Shadows**: Modern, flat design approach

### **Color System**
- **Customizable Timer Color**: User-selectable text color
- **Customizable Background**: User-selectable background color
- **High Contrast Options**: Suitable for various lighting conditions
- **Church-Appropriate**: Professional color schemes

### **Interface Layout**
```
Setup Screen:
├── Timer Input (Hours, Minutes, Seconds)
├── Color Customization Panel
├── Quick Preset Buttons
└── Start Timer Button

Fullscreen Timer:
├── Large Timer Display
├── Minimal Controls (fade out after 5 seconds)
│   ├── Return Button
│   └── +5 Min Button
└── Warning Overlays (when time running low)
```

## 📋 **Target Use Cases**

### **Church Services**
- **Sermon Timing**: Help pastors manage sermon duration
- **Prayer Segments**: Time opening/closing prayers
- **Worship Periods**: Manage music and worship segments
- **Service Breaks**: Fellowship and intermission timing

### **Events & Conferences**
- **Speaker Sessions**: Professional timing for presentations
- **Workshop Segments**: Break sessions into timed portions
- **Q&A Periods**: Allocate specific time for audience interaction
- **Networking Breaks**: Manage social interaction periods

### **Educational Settings**
- **Lecture Timing**: Keep academic presentations on schedule
- **Exam Duration**: Visual countdown for test periods
- **Presentation Practice**: Help students manage speaking time

## 🛠 **Technical Requirements**

### **Performance**
- **Responsive UI**: Smooth transitions and interactions
- **Low Resource Usage**: Minimal system impact during operation
- **Reliable Timing**: Accurate countdown functionality

### **Compatibility**
- **Windows Support**: Primary target platform
- **Display Compatibility**: Works on various screen resolutions
- **Fullscreen Management**: Proper fullscreen entry/exit

### **User Experience**
- **Intuitive Interface**: Easy setup and operation
- **Professional Appearance**: Suitable for formal environments
- **Accessibility**: High contrast options for visibility

## 📦 **Deployment Requirements**

- **Single Executable**: Easy installation and distribution
- **No External Dependencies**: Self-contained application
- **Settings Persistence**: Remember user preferences
- **Quick Launch**: Fast startup time

---

**Next Steps**: Implement using a more suitable technology stack (C# WPF recommended) to properly address all user requirements and ensure reliable desktop application behavior.
