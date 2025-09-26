#!/bin/bash

# Package Installation Script
# Installs essential packages and sets up repositories
# Supports both Fedora and Ubuntu

set -euo pipefail

echo "📦 Installing essential packages..."

# Detect distribution
if command -v dnf >/dev/null 2>&1; then
    DISTRO="fedora"
    PKG_MGR="dnf"
elif command -v apt >/dev/null 2>&1; then
    DISTRO="ubuntu"
    PKG_MGR="apt"
else
    echo "❌ Unsupported distribution. This script requires Fedora or Ubuntu."
    exit 1
fi

echo "🔍 Detected distribution: $DISTRO"

if [[ "$DISTRO" == "fedora" ]]; then
    # Fedora package installation
    
    # Update package list
    sudo dnf update -y

    # Enable RPM Fusion repositories for additional packages
    echo "🔧 Enabling RPM Fusion repositories..."
    sudo dnf install -y \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

    # Install 32-bit compatibility libraries
    sudo dnf install -y glibc.i686

    # Install essential packages
    sudo dnf install -y \
        gnome-tweaks \
        gnome-extensions-app \
        chrome-gnome-shell \
        dconf-editor \
        gnome-weather \
        flatpak \
        git \
        curl \
        wget \
        jq \
        libgtop2-devel \
        fuse \
        p7zip \
        p7zip-plugins \
        lm_sensors \
        xdotool \
        python3-requests \
        python3-lxml \
        python3-beautifulsoup4

elif [[ "$DISTRO" == "ubuntu" ]]; then
    # Ubuntu package installation
    
    # Add i386 architecture for 32-bit support
    sudo dpkg --add-architecture i386

    # Update package list
    sudo apt update

    # Install 32-bit compatibility libraries
    sudo apt install -y libc6:i386

    # Install essential packages
    sudo apt install -y \
        gnome-tweaks \
        gnome-shell-extensions \
        gnome-shell-extension-manager \
        chrome-gnome-shell \
        dconf-editor \
        gnome-weather \
        flatpak \
        git \
        curl \
        wget \
        jq \
        gir1.2-gtop-2.0 \
        libfuse2 \
        p7zip-full \
        lm-sensors \
        xdotool \
        python3-requests \
        python3-lxml \
        python3-bs4
fi

echo "🔧 Setting up Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "✅ Package installation complete!"
