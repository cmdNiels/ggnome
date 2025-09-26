#!/bin/bash

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Repository config
REPO_URL="https://github.com/cmdNiels/ggnome.git"
TEMP_DIR="/tmp/ggnome-setup-$$"

# Cleanup on exit
trap 'rm -rf "$TEMP_DIR"' EXIT

# Welcome message
echo -e "${CYAN}🎨 GNOME Configuration Setup${NC}"
echo ""
echo "This will download and apply a complete GNOME desktop configuration."
echo ""

# Confirmation
read -p "Continue with GNOME setup? (y/N): " confirm
[[ ! "$confirm" =~ ^[Yy]$ ]] && exit 0

# Install git if needed
if ! command -v git >/dev/null; then
    if command -v dnf >/dev/null 2>&1; then
        sudo dnf update -y && sudo dnf install -y git
    elif command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y git
    else
        echo "❌ Could not detect package manager to install git"
        exit 1
    fi
fi

# Clone repo
echo -e "${BLUE}Cloning repository...${NC}"
git clone "$REPO_URL" "$TEMP_DIR"

# Run scripts
cd "$TEMP_DIR"
for script in scripts/*.sh; do
    echo -e "${BLUE}Running $(basename "$script")...${NC}"
    chmod +x "$script"
    if "$script"; then
        echo -e "${GREEN}✅ $(basename "$script") completed${NC}"
    else
        echo -e "${RED}❌ $(basename "$script") failed${NC}"
        read -p "Continue? (y/N): " continue_choice
        [[ ! "$continue_choice" =~ ^[Yy]$ ]] && exit 1
    fi
done

echo ""
echo -e "${CYAN}🏁 Setup complete!${NC}"
echo "Log out and back in to see all changes."