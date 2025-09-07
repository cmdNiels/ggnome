#!/bin/bash

# Package Installation Script
# Installs essential packages and sets up repositories

set -euo pipefail

echo "📦 Installing essential packages..."

# Update package list
sudo apt update

# Install essential packages
sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-shell-extension-manager \
    chrome-gnome-shell \
    dconf-editor \
    flatpak \
    git \
    curl \
    wget \
    jq \
    gir1.2-gtop-2.0 \
    lm-sensors \
    xdotool \
    python3-requests \
    python3-lxml \
    python3-bs4

echo "🔧 Setting up Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "✅ Package installation complete!"
