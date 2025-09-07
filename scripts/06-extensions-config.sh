#!/bin/bash

# Extensions Configuration Script
# Configures all GNOME Shell extensions using dconf

set -euo pipefail

echo "🔧 Configuring GNOME Shell extensions..."

# Configure Just Perfection (using dconf - no gsettings schema)
echo "✨ Configuring Just Perfection..."
dconf write /org/gnome/shell/extensions/just-perfection/accessibility-menu false
dconf write /org/gnome/shell/extensions/just-perfection/activities-button false
dconf write /org/gnome/shell/extensions/just-perfection/alt-tab-icon-size 0
dconf write /org/gnome/shell/extensions/just-perfection/alt-tab-small-icon-size 0
dconf write /org/gnome/shell/extensions/just-perfection/alt-tab-window-preview-size 0
dconf write /org/gnome/shell/extensions/just-perfection/animation 1
dconf write /org/gnome/shell/extensions/just-perfection/background-menu true
dconf write /org/gnome/shell/extensions/just-perfection/calendar true
dconf write /org/gnome/shell/extensions/just-perfection/clock-menu true
dconf write /org/gnome/shell/extensions/just-perfection/controls-manager-spacing-size 0
dconf write /org/gnome/shell/extensions/just-perfection/dash-separator false
dconf write /org/gnome/shell/extensions/just-perfection/keyboard-layout false
dconf write /org/gnome/shell/extensions/just-perfection/max-displayed-search-results 0
dconf write /org/gnome/shell/extensions/just-perfection/power-icon false
dconf write /org/gnome/shell/extensions/just-perfection/quick-settings true
dconf write /org/gnome/shell/extensions/just-perfection/quick-settings-dark-mode false
dconf write /org/gnome/shell/extensions/just-perfection/quick-settings-night-light false
dconf write /org/gnome/shell/extensions/just-perfection/ripple-box false
dconf write /org/gnome/shell/extensions/just-perfection/screen-recording-indicator false
dconf write /org/gnome/shell/extensions/just-perfection/screen-sharing-indicator false
dconf write /org/gnome/shell/extensions/just-perfection/search true
dconf write /org/gnome/shell/extensions/just-perfection/show-apps-button false
dconf write /org/gnome/shell/extensions/just-perfection/startup-status 0
dconf write /org/gnome/shell/extensions/just-perfection/support-notifier-showed-version 34
dconf write /org/gnome/shell/extensions/just-perfection/switcher-popup-delay true
dconf write /org/gnome/shell/extensions/just-perfection/window-picker-icon false
dconf write /org/gnome/shell/extensions/just-perfection/window-preview-caption true
dconf write /org/gnome/shell/extensions/just-perfection/window-preview-close-button true
dconf write /org/gnome/shell/extensions/just-perfection/workspace-peek true
dconf write /org/gnome/shell/extensions/just-perfection/workspace-popup false
dconf write /org/gnome/shell/extensions/just-perfection/workspace-switcher-size 5
dconf write /org/gnome/shell/extensions/just-perfection/workspaces-in-app-grid true

# Configure Blur My Shell (using dconf - no gsettings schema)
echo "💫 Configuring Blur My Shell..."
dconf write /org/gnome/shell/extensions/blur-my-shell/hacks-level 2
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/blur false
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/blur-on-overview false
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/dynamic-opacity false
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/enable-all true
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/opacity 240
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/sigma 6
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/blur true
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/brightness 0.6
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/override-background true
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/sigma 6
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/static-blur false
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/style-dash-to-dock 0
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/unblur-in-overview true
dconf write /org/gnome/shell/extensions/blur-my-shell/panel/brightness 0.6
dconf write /org/gnome/shell/extensions/blur-my-shell/panel/override-background true
dconf write /org/gnome/shell/extensions/blur-my-shell/panel/sigma 30
dconf write /org/gnome/shell/extensions/blur-my-shell/panel/static-blur false

# Configure Auto Move Windows (using dconf - no gsettings schema)
echo "📦 Configuring Auto Move Windows..."
dconf write /org/gnome/shell/extensions/auto-move-windows/application-list "['code_code.desktop:3', 'android-studio_android-studio.desktop:3', 'Modrinth App.desktop:1', 'snap-handle-link.desktop:1', 'org.gnome.Terminal.desktop:4', 'org.gnome.Terminal.Preferences.desktop:4', 'obs-studio_obs-studio.desktop:5', 'signal-desktop_signal-desktop.desktop:2', 'discord.desktop:2']"

# Configure Clipboard History (using dconf - no gsettings schema)
echo "📋 Configuring Clipboard History..."
dconf write /org/gnome/shell/extensions/clipboard-history/cache-size 105
dconf write /org/gnome/shell/extensions/clipboard-history/display-mode 0
dconf write /org/gnome/shell/extensions/clipboard-history/enable-keybindings true
dconf write /org/gnome/shell/extensions/clipboard-history/history-size 1000
dconf write /org/gnome/shell/extensions/clipboard-history/toggle-menu "['<Super>v']"
dconf write /org/gnome/shell/extensions/clipboard-history/window-width-percentage 25

# Configure Vitals (using dconf - no gsettings schema)
echo "📊 Configuring Vitals..."
dconf write /org/gnome/shell/extensions/vitals/hot-sensors "['_processor_usage_', '_memory_usage_']"
dconf write /org/gnome/shell/extensions/vitals/memory-measurement 0
dconf write /org/gnome/shell/extensions/vitals/show-gpu false
dconf write /org/gnome/shell/extensions/vitals/update-time 3

# Configure User Theme (using dconf - no gsettings schema)
echo "🎨 Configuring User Theme..."
dconf write /org/gnome/shell/extensions/user-theme/name "'Yaru-dark'"

# Configure Hide Top Bar (using dconf - no gsettings schema)
echo "🫥 Configuring Hide Top Bar..."
dconf write /org/gnome/shell/extensions/hidetopbar/enable-active-window false
dconf write /org/gnome/shell/extensions/hidetopbar/mouse-sensitive false
dconf write /org/gnome/shell/extensions/hidetopbar/mouse-sensitive-fullscreen-window false

# Configure Default Workspace (using dconf - no gsettings schema)
echo "🏠 Configuring Default Workspace..."
dconf write /org/gnome/shell/extensions/default-workspace/default-workspace-number 1

# Configure Extension List (using dconf - no gsettings schema)
echo "📋 Configuring Extension List..."
dconf write /org/gnome/shell/extensions/extension-list/button-icon 0

# Configure Weather O'Not (using dconf - no gsettings schema)
echo "🌤️ Configuring Weather O'Not..."
dconf write /org/gnome/shell/extensions/weatherornot/position "'left'"

# Configure Forge (Tiling Window Manager) (using dconf - no gsettings schema)
echo "🏗️ Configuring Forge..."
dconf write /org/gnome/shell/extensions/forge/auto-split-enabled false
dconf write /org/gnome/shell/extensions/forge/dnd-center-layout "'stacked'"
dconf write /org/gnome/shell/extensions/forge/float-always-on-top-enabled false
dconf write /org/gnome/shell/extensions/forge/focus-border-toggle false
dconf write /org/gnome/shell/extensions/forge/move-pointer-focus-enabled false
dconf write /org/gnome/shell/extensions/forge/preview-hint-enabled true
dconf write /org/gnome/shell/extensions/forge/quick-settings-enabled false
dconf write /org/gnome/shell/extensions/forge/split-border-toggle false
dconf write /org/gnome/shell/extensions/forge/stacked-tiling-mode-enabled false
dconf write /org/gnome/shell/extensions/forge/tabbed-tiling-mode-enabled false
dconf write /org/gnome/shell/extensions/forge/window-gap-hidden-on-single false
dconf write /org/gnome/shell/extensions/forge/window-gap-size 4
dconf write /org/gnome/shell/extensions/forge/window-gap-size-increment 2
dconf write /org/gnome/shell/extensions/forge/workspace-skip-tile "'2,3'"

# Extensions that work automatically once enabled (no configuration needed):
echo "🎯 The following extensions are configured automatically once enabled:"
echo "   • Static Workspace Background"
echo "   • Current Workspace Name" 
echo "   • Steal My Focus Window"
echo "   • GSConnect (requires device pairing)"

echo "✅ Extensions configuration complete!"
