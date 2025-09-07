#!/bin/bash

# Dash to Dock Configuration Script
# Configures the built-in dash-to-dock extension

set -euo pipefail

echo "🚢 Configuring Dash to Dock..."

# Set dock settings (Dash to Dock is integrated in GNOME Shell)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock always-center-icons false

# Disable all hotkey bindings
for i in {1..10}; do
    gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-$i "@as []"
    gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-$i "@as []"
done

# Appearance settings
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme "false"
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors false
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DOTS'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true

# Hide unnecessary elements
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted false
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

# Click and scroll actions
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'switch-workspace'
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock shift-middle-click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-always-in-the-edge true
gsettings set org.gnome.shell.extensions.dash-to-dock workspace-agnostic-urgent-windows false

# Transparency and background
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DYNAMIC'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color 'rgb(0,0,0)'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.80000000000000000
gsettings set org.gnome.shell.extensions.dash-to-dock height-fraction 0.90000000000000000

echo "✅ Dash to Dock configuration complete!"
