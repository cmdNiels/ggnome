# GNOME Desktop Configuration

A complete GNOME desktop customization setup that recreates a polished, productivity-focused desktop environment with modern themes, extensions, and optimized settings. 

**✅ Universal Support** - Works on both Fedora and Ubuntu with automatic package manager detection (dnf/apt).

## ✨ Features

- **🎨 Modern Theme Stack**: Yaru-blue-dark GTK theme with WhiteSur icons and ArcMidnight cursors
- **🔌 Essential Extensions**: 14+ carefully selected GNOME Shell extensions for enhanced productivity
- **🏠 Smart Workspaces**: 5 pre-configured workspaces with auto-window assignment
- **⌨️ Optimized Keybindings**: Streamlined shortcuts and disabled conflicting defaults
- **💻 Terminal Customization**: Transparent terminal with optimized colors and sizing
- **🖼️ Dynamic Wallpapers**: BigSur-style time-based wallpaper system
- **📱 App Organization**: Organized dock and app folders
- **⚙️ Performance Tuned**: Optimized animations, power settings, and resource usage

## 🚀 Quick Installation

### One-Liner (Recommended)
```bash
wget -qO- https://raw.githubusercontent.com/cmdNiels/ggnome/main/init.sh | bash
```
*This will automatically download the repository and run the complete setup.*

### Manual Installation
```bash
git clone https://github.com/cmdNiels/ggnome.git
cd ggnome
bash init.sh
```

## 📋 What Gets Installed

### GNOME Shell Extensions
- **Auto Move Windows** - Automatic app workspace assignment
- **Blur My Shell** - Modern blur effects for UI elements
- **Clipboard History** - Clipboard manager with Super+V shortcut
- **Current Workspace Name** - Display current workspace in panel
- **Default Workspace** - Always start on workspace 1
- **Extension List** - Quick extension management
- **Forge** - Advanced window tiling and management
- **GSConnect** - Android device integration
- **Hide Top Bar** - Auto-hide top panel when not needed
- **Just Perfection** - UI cleanup and customization
- **Static Workspace Background** - Per-workspace wallpapers
- **Steal My Focus Window** - Proper window focus handling
- **User Themes** - Custom shell theme support
- **Vitals** - System monitoring in top bar
- **Weather O'Not** - Weather information display

### Themes & Appearance
- **GTK Theme**: Yaru-blue-dark
- **Icon Theme**: WhiteSur
- **Cursor Theme**: ArcMidnight-cursors
- **Font**: SF Pro (with fallback to system font)
- **Shell Theme**: Yaru-dark

### System Configuration
- **5 Named Workspaces**: Personal, Discord, Work, Terminal, Recording
- **Custom Keybindings**: Super+1-5 for workspace switching
- **Power Management**: Optimized sleep and idle settings
- **Privacy Settings**: Disabled telemetry and usage stats
- **Mouse Settings**: Flat acceleration profile for gaming/precision
- **Night Light**: Auto-schedule with warm temperature

## 🖥️ Workspace Layout

1. **Personal** - General applications and browsing
2. **Discord** - Communication apps (Discord, Signal)
3. **Work** - Development tools (VS Code, Android Studio)
4. **Terminal** - Terminal applications and system tools
5. **Recording** - OBS Studio and media applications

## ⚙️ Requirements

- **Fedora 38+** or **Ubuntu 22.04+** with **GNOME 42+**
- **Internet connection** for downloading extensions and themes
- **Sudo privileges** for package installation
- **Git** (automatically installed if not present)

The script automatically detects your distribution and uses the appropriate package manager.

## 🔧 Customization

All settings are applied via `gsettings` and `dconf`, making them easily reversible. The complete configuration is exported in `dconf-export.dconf` for reference.

### Key Files
- `script.sh` - Main installation script
- `init.sh` - Entry point with confirmation prompts
- `dconf-export.dconf` - Complete configuration export

## 🔄 Post-Installation

1. **Log out and back in** to see all changes
4. **Configure GSConnect** for Android device pairing

## ⚠️ Notes

- Some extensions may require manual configuration after installation
- Theme installation requires internet access
- Wayland users need to log out/in for GNOME Shell changes
- The script will prompt before installing development tools

## 🔗 Related

- [GNOME Extensions](https://extensions.gnome.org/)
- [Yaru Theme](https://github.com/ubuntu/yaru)
- [WhiteSur Icons](https://github.com/vinceliuice/WhiteSur-icon-theme)

## 📄 License

This configuration is provided as-is. Individual components (themes, extensions) retain their original licenses.