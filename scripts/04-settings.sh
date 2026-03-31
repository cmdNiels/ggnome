#!/bin/bash

# GNOME Settings Configuration Script
# Applies all GNOME desktop settings via gsettings

set -euo pipefail

echo "⚙️  Applying GNOME settings..."

# Interface settings
echo "🖥️  Configuring interface settings..."
gsettings set org.gnome.desktop.interface font-name 'SF Pro 11 @opsz=17'
gsettings set org.gnome.desktop.interface document-font-name 'SF Pro 11 @opsz=17'
gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Sans Mono 13'
gsettings set org.gnome.desktop.interface clock-show-date false
gsettings set org.gnome.desktop.interface clock-show-seconds false
gsettings set org.gnome.desktop.interface enable-animations true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'slight'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

# Window management
echo "🪟 Configuring window management..."
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.desktop.wm.preferences workspace-names "['Personal', 'Discord', 'Work', 'Terminal', 'Recording']"

# Workspaces and Mutter settings
echo "🏠 Configuring workspaces..."
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter edge-tiling false
gsettings set org.gnome.mutter overlay-key 'Super_L'
gsettings set org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.mutter check-alive-timeout 0

# Workspace keybindings
echo "⌨️  Setting up keybindings..."
for i in {1..9}; do
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

# Disable conflicting keybindings
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "@as []"
gsettings set org.gnome.desktop.wm.keybindings begin-move "@as []"
gsettings set org.gnome.desktop.wm.keybindings begin-resize "@as []"
gsettings set org.gnome.desktop.wm.keybindings maximize "@as []"
gsettings set org.gnome.desktop.wm.keybindings minimize "@as []"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "@as []"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "@as []"

# Mutter keybindings
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "@as []"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "@as []"

# Privacy settings
echo "🔒 Configuring privacy settings..."
gsettings set org.gnome.desktop.privacy report-technical-problems false
gsettings set org.gnome.desktop.privacy send-software-usage-stats false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Power settings
echo "🔋 Configuring power settings..."
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Session settings
echo "💤 Configuring session settings..."
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true

# Mouse settings
echo "🖱️  Configuring mouse settings..."
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.peripherals.mouse speed 0.067796610169491567

# Night light
echo "🌙 Configuring night light..."
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 21.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2077

# Files/Nautilus settings
echo "📁 Configuring file manager..."
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences fts-enabled false
gsettings set org.gnome.nautilus.preferences show-delete-permanently true

# Shell settings
echo "🐚 Configuring shell settings..."
gsettings set org.gnome.shell development-tools true
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell disabled-extensions "['ding@rastersoft.com']"
gsettings set org.gnome.shell enabled-extensions "['hidetopbar@mathieu.bidon.ca', 'forge@jmmaranan.com', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'Vitals@CoreCoding.com', 'weatherornot@somepaulo.github.io', 'blur-my-shell@aunetx', 'gsconnect@andyholmes.github.io', 'extension-list@tu.berry', 'static-workspace-background@CleoMenezesJr.github.io', 'clipboard-history@alexsaveau.dev', 'steal-my-focus-window@steal-my-focus-window', 'default-workspace@mateusrodcosta.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'currentworkspacename@jaybeeunix.dev', 'just-perfection-desktop@just-perfection']"
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Power settings
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-suspend-with-external-monitor false


# Set favorite apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Settings.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'code_code.desktop', 'discord.desktop']"

# App folders
echo "📱 Setting up app folders..."
gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'System', 'Games']"

# Locale settings
echo "🌍 Configuring locale settings..."
read -p "Set locale to use Celsius? [y/N]: " -n 1 -r locale_choice
echo ""
if [[ $locale_choice =~ ^[Yy]$ ]]; then
    echo "🌍 Setting locale to metric measurements..."
    sudo localectl set-locale LC_MEASUREMENT=en_GB.UTF-8
    echo "✅ Locale measurement set to metric format"
else
    echo "⏭️  Skipping locale measurement configuration"
fi

echo ""
echo "✅ GNOME settings configuration complete!"
