#!/bin/bash

# GNOME Shell Extensions Installation Script
# Installs and configures all GNOME Shell extensions

set -euo pipefail

# Function to install GNOME Shell extensions using D-Bus
install_extension() {
    local extension_url="$1"
    local extension_name="$2"
    
    echo "🔌 Installing $extension_name..."
    
    # Extract extension ID from URL
    local id=$(echo "${extension_url}" | cut --delimiter=/ --fields=5)
    local url_pkg_metadata="https://extensions.gnome.org/extension-info/?pk=${id}"
    
    # Get extension metadata to extract UUID
    echo "📥 Fetching metadata for $extension_name..."
    local metadata=$(curl -s "$url_pkg_metadata")
    
    if [[ -z "$metadata" ]]; then
        echo "⚠️  Failed to get metadata for $extension_name, skipping..."
        return 1
    fi
    
    # Extract UUID
    local uuid=$(echo "$metadata" | jq -r '.uuid')
    
    if [[ "$uuid" == "null" || -z "$uuid" ]]; then
        echo "⚠️  Could not parse UUID for $extension_name, skipping..."
        return 1
    fi
    
    # Check if extension is already installed
    if gnome-extensions list | grep -q "$uuid"; then
        echo "✅ $extension_name already installed, enabling..."
        gnome-extensions enable "$uuid"
        return 0
    fi
    
    # Install extension using GNOME Shell D-Bus interface
    echo "🔧 Installing $extension_name via D-Bus..."
    if busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Extensions InstallRemoteExtension s "$uuid" >/dev/null 2>&1; then
        # Wait a moment for installation to complete
        sleep 2
        
        # Enable the extension
        if gnome-extensions enable "$uuid" >/dev/null 2>&1; then
            echo "✅ Successfully installed and enabled $extension_name"
        else
            echo "✅ Successfully installed $extension_name (enable manually if needed)"
        fi
    else
        echo "⚠️  Failed to install $extension_name via D-Bus"
        echo "💡 You may need to install this extension manually from: $extension_url"
        return 1
    fi
}

echo "🔌 Installing and configuring GNOME Shell extensions..."

# List of extensions from extensions.gnome.org URLs
declare -A extensions=(
    ["https://extensions.gnome.org/extension/16/auto-move-windows/"]="Auto Move Windows"
    ["https://extensions.gnome.org/extension/3193/blur-my-shell/"]="Blur My Shell"
    ["https://extensions.gnome.org/extension/4839/clipboard-history/"]="Clipboard History"
    ["https://extensions.gnome.org/extension/8233/current-workspace-name/"]="Current Workspace Name"
    ["https://extensions.gnome.org/extension/4783/default-workspace/"]="Default Workspace"
    ["https://extensions.gnome.org/extension/3088/extension-list/"]="Extension List"
    ["https://extensions.gnome.org/extension/1319/gsconnect/"]="GSConnect"
    ["https://extensions.gnome.org/extension/545/hide-top-bar/"]="Hide Top Bar"
    ["https://extensions.gnome.org/extension/3843/just-perfection/"]="Just Perfection"
    ["https://extensions.gnome.org/extension/8505/static-workspace-background/"]="Static Workspace Background"
    ["https://extensions.gnome.org/extension/6385/steal-my-focus-window/"]="Steal My Focus Window"
    ["https://extensions.gnome.org/extension/19/user-themes/"]="User Themes"
    ["https://extensions.gnome.org/extension/1460/vitals/"]="Vitals"
    ["https://extensions.gnome.org/extension/5660/weather-or-not/"]="Weather O'Not"
)

# Install each extension
for url in "${!extensions[@]}"; do
    install_extension "$url" "${extensions[$url]}"
done

# Wait for extensions to be available
echo "⏳ Waiting for extensions to load..."
sleep 3

echo "✅ GNOME Shell extensions installation complete!"
