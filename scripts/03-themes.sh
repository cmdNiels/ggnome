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

# Install SF Pro font
if ! fc-list | grep -q "SF Pro"; then
    echo "📥 Installing SF Pro font..."
    
    # Create fonts directory if it doesn't exist
    mkdir -p ~/.local/share/fonts
    
    # Download SF Pro font
    echo "  Downloading SF Pro font..."
    if curl -L "https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/refs/heads/master/SF-Pro.ttf" -o ~/.local/share/fonts/SF-Pro.ttf; then
        # Refresh font cache
        fc-cache -f -v ~/.local/share/fonts > /dev/null 2>&1
        echo "✅ SF Pro font installed successfully"
    else
        echo "⚠️  Failed to download SF Pro font"
        echo "    The system will fall back to the default font"
    fi
else
    echo "✅ SF Pro font already installed"
fi

# Install Apple Emoji font
if ! fc-list | grep -q "Apple Color Emoji"; then
    echo "📥 Installing Apple Color Emoji font..."
    
    # Create fonts directory if it doesn't exist
    mkdir -p ~/.local/share/fonts
    
    # Download Apple Color Emoji font
    echo "  Downloading Apple Color Emoji font..."
    if curl -L "https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf" -o ~/.local/share/fonts/AppleColorEmoji.ttf; then
        
        # Create fontconfig directory
        mkdir -p ~/.config/fontconfig/conf.d
        
        # Create emoji font configuration
        echo "  Configuring emoji font priority..."
        cat > ~/.config/fontconfig/conf.d/01-emoji.conf << 'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<alias>
		<family>emoji</family>
		<prefer>
			<family>Apple Color Emoji</family>
		</prefer>
	</alias>
</fontconfig>
EOF
        
        # Create configuration to disable Noto Color Emoji priority
        cat > ~/.config/fontconfig/conf.d/10-disable-noto-emoji.conf << 'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<!-- Deprioritize Noto Color Emoji -->
	<match target="font">
		<test name="family">
			<string>Noto Color Emoji</string>
		</test>
		<edit name="priority" mode="assign">
			<int>0</int>
		</edit>
	</match>
</fontconfig>
EOF
        
        # Refresh font cache
        echo "  Refreshing font cache..."
        fc-cache -f -v > /dev/null 2>&1
        echo "✅ Apple Color Emoji font installed successfully"
        echo "    Note: You may need to select a different font in GNOME Tweaks for emojis to work properly"
    else
        echo "⚠️  Failed to download Apple Color Emoji font"
        echo "    Emojis will use the default system font"
    fi
else
    echo "✅ Apple Color Emoji font already installed"
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
