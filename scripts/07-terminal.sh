#!/bin/bash

# Terminal Configuration Script
# Configures GNOME Terminal settings and appearance

set -euo pipefail

echo "💻 Configuring GNOME Terminal..."

# Get the default terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

if [[ -n "$PROFILE_ID" ]]; then
    echo "🎯 Found terminal profile: $PROFILE_ID"
    
    # Configure terminal appearance and behavior
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ audible-bell false
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ background-color 'rgb(0,0,0)'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ foreground-color 'rgb(255,255,255)'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ background-transparency-percent 48
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ cursor-shape 'ibeam'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ default-size-columns 168
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ default-size-rows 35
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-system-font true
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-theme-colors false
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-theme-transparency false
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ use-transparent-background true
    
    echo "✅ Terminal configuration complete"
else
    echo "⚠️  Could not find default terminal profile"
    echo "    You may need to configure terminal settings manually"
fi

echo "✅ Terminal setup complete!"
