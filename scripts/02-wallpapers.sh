#!/bin/bash

# Wallpaper and Background Setup Script
# Downloads and configures wallpapers and backgrounds

set -euo pipefail

echo "🖼️  Setting up wallpapers..."

# Create wallpapers directory
mkdir -p ~/.wallpapers/BigSur

# Clone wallpapers from repository
temp_dir=$(mktemp -d)
git clone https://github.com/cmdNiels/ggnome.git "$temp_dir"
rsync -a "$temp_dir/.wallpapers/" "$HOME/.wallpapers/"

# Process the bigsur.xml template to replace @HOME@ with actual home directory
if [[ -f ~/.wallpapers/BigSur/bigsur.xml ]]; then
    sed -i "s|@HOME@|$HOME|g" ~/.wallpapers/BigSur/bigsur.xml
fi

# Set wallpaper
if [[ -f ~/.wallpapers/BigSur/bigsur.xml ]]; then
    gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.wallpapers/BigSur/bigsur.xml"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.wallpapers/BigSur/bigsur.xml"
    echo "✅ BigSur wallpaper set successfully"
else
    echo "⚠️  BigSur wallpaper not found, using default"
    gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-l.webp'
    gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/gnome/adwaita-d.webp'
fi

gsettings set org.gnome.desktop.background picture-options 'zoom'

# Clean up temporary directory
rm -rf "$temp_dir"

echo "✅ Wallpaper setup complete!"
