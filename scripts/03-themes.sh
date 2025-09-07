#!/bin/bash

# Themes and Icons Installation Script
# Installs and configures themes, icons, and cursors

set -euo pipefail

echo "🎨 Installing additional themes and icons..."

# Install WhiteSur icon theme
if [[ ! -d ~/.local/share/icons/WhiteSur ]]; then
    echo "📥 Installing WhiteSur icon theme..."
    temp_dir=$(mktemp -d)
    cd "$temp_dir"
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
    cd WhiteSur-icon-theme
    ./install.sh
    cd - > /dev/null
    rm -rf "$temp_dir"
    echo "✅ WhiteSur icons installed"
else
    echo "✅ WhiteSur icons already installed"
fi

# Install Yaru themes if not available
if ! gsettings get org.gnome.desktop.interface gtk-theme | grep -q "Yaru"; then
    echo "📥 Installing Yaru themes..."
    sudo apt install -y yaru-theme-gtk yaru-theme-icon yaru-theme-sound
    echo "✅ Yaru themes installed"
else
    echo "✅ Yaru themes already available"
fi

# Check for SF Pro font
if ! fc-list | grep -q "SF Pro"; then
    echo "⚠️  SF Pro font not found"
    echo "    You can manually install SF Pro font from Apple or use a similar font"
    echo "    The system will fall back to the default font for now"
fi

# Check for ArcMidnight cursor theme
if [[ ! -d ~/.local/share/icons/ArcMidnight-cursors ]] && [[ ! -d /usr/share/icons/ArcMidnight-cursors ]]; then
    echo "⚠️  ArcMidnight cursor theme not found"
    echo "    You may need to manually install ArcMidnight cursor theme"
    echo "    Falling back to default cursor theme"
    # Set fallback cursor theme
    gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
else
    echo "✅ ArcMidnight cursor theme found"
    gsettings set org.gnome.desktop.interface cursor-theme 'ArcMidnight-cursors'
fi

# Apply theme settings
echo "🎨 Applying theme settings..."
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'blue'

echo "✅ Themes and icons setup complete!"
