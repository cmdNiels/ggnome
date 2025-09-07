#!/bin/bash

# Finalization Script
# Final system optimizations and restart procedures

set -euo pipefail

echo "🏁 Finalizing GNOME setup..."

# Create common directories if they don't exist
echo "📁 Creating common directories..."
mkdir -p ~/dev
mkdir -p ~/.wallpapers/BigSur
mkdir -p ~/Pictures/Screenshots

# Final system optimization
echo "⚙️  Applying final optimizations..."

# Check if we're on X11 or Wayland for GNOME Shell restart
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
    echo "🔄 Restarting GNOME Shell on X11..."
    nohup bash -c 'sleep 2; killall -HUP gnome-shell' >/dev/null 2>&1 &
    echo "✅ GNOME Shell restart initiated"
else
    echo "⚠️  Running on Wayland - GNOME Shell restart requires logout/login"
fi

echo ""
echo "🎉 GNOME customization complete!"
echo ""
echo "📋 Configuration Summary:"
echo "   • ✅ Essential packages installed"
echo "   • ✅ GNOME Shell extensions installed and configured"
echo "   • ✅ Themes and icons applied"
echo "   • ✅ Wallpapers set up"
echo "   • ✅ Desktop settings configured"
echo "   • ✅ Dock customized"
echo "   • ✅ Terminal configured"
echo "   • ✅ Workspaces organized (Personal, Discord, Work, Terminal, Recording)"
echo ""
echo "🔄 Next Steps:"
echo "   1. Log out and log back in to see all changes"
echo "   2. Some extensions may require additional manual configuration"
echo "   3. If themes don't apply immediately, try switching themes in Tweaks and back"
echo "   4. GSConnect requires manual device pairing"
echo ""

# Optional: Logout prompt
read -p "Log out now to apply all changes? (y/N): " logout_choice
if [[ "$logout_choice" =~ ^[Yy]$ ]]; then
    echo "👋 Logging out..."
    gnome-session-quit --logout --no-prompt
else
    echo "✅ Setup complete! Remember to log out and back in to see all changes."
fi
