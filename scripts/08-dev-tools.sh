#!/bin/bash

# Development Tools Installation Script (Optional)
# Installs common development tools and utilities

set -euo pipefail

echo "🛠️  Development tools installation..."

# Ask user if they want to install development tools
read -p "Install development tools? (y/N): " install_dev
if [[ ! "$install_dev" =~ ^[Yy]$ ]]; then
    echo "⏭️  Skipping development tools installation"
    exit 0
fi

echo "📦 Installing development tools..."

# Install development packages
sudo apt install -y \
    build-essential \
    python3-pip \
    nodejs \
    npm \
    docker.io \
    docker-compose \
    android-tools-adb \
    android-tools-fastboot

# Add user to docker group if not already added
if ! groups | grep -q docker; then
    sudo usermod -aG docker "$USER"
    echo "✅ Added user to docker group"
    echo "⚠️  You'll need to log out and back in for docker group changes to take effect"
else
    echo "✅ User already in docker group"
fi

# Create common development directories
echo "📁 Creating development directories..."
mkdir -p ~/dev
mkdir -p ~/Pictures/Screenshots

echo "✅ Development tools installation complete!"
