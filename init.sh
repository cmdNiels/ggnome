#!/bin/bash

# GNOME Configuration Repository - Main Setup Script
# This is the main entry point for the modular GNOME customization setup

set -euo pipefail

# Color codes for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

log_step() {
    echo -e "${PURPLE}🔄 $1${NC}"
}

# Function to check if script exists and is executable
check_script() {
    local script_path="$1"
    if [[ ! -f "$script_path" ]]; then
        log_error "Script not found: $script_path"
        return 1
    fi
    if [[ ! -x "$script_path" ]]; then
        log_warning "Making script executable: $script_path"
        chmod +x "$script_path"
    fi
    return 0
}

# Function to run a script with error handling
run_script() {
    local script_path="$1"
    local script_name="$(basename "$script_path")"
    
    log_step "Running $script_name..."
    
    if ! check_script "$script_path"; then
        return 1
    fi
    
    if "$script_path"; then
        log_success "$script_name completed successfully"
        return 0
    else
        log_error "$script_name failed"
        return 1
    fi
}

# Welcome message
echo -e "${CYAN}🎨 GNOME Configuration Setup${NC}"
echo -e "${CYAN}==============================${NC}"
echo ""
echo "This will download and apply a complete GNOME desktop configuration."
echo "The setup includes:"
echo "  • Essential package installation"
echo "  • GNOME Shell extensions installation and configuration"
echo "  • Theme and appearance customization"
echo "  • System settings and keybinding configuration"
echo "  • Terminal customization"
echo "  • Wallpaper and icon setup"
echo ""

# Check if we're in the right directory
if [[ ! -d "$SCRIPTS_DIR" ]]; then
    log_error "Scripts directory not found: $SCRIPTS_DIR"
    log_info "Please run this from the ggnome repository directory or use the one-liner:"
    echo ""
    echo "curl -fsSL https://raw.githubusercontent.com/cmdNiels/ggnome/main/init.sh | bash"
    echo ""
    echo "Or clone and run manually:"
    echo "git clone https://github.com/cmdNiels/ggnome.git && cd ggnome && bash init.sh"
    exit 1
fi

# Confirmation prompt
read -p "Continue with GNOME setup? (y/N): " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    log_warning "Setup cancelled."
    exit 0
fi

echo ""
log_info "Starting modular GNOME setup..."
echo ""

# Array of scripts to run in order
declare -a scripts=(
    "00-packages.sh"
    "01-extensions.sh"
    "02-wallpapers.sh"
    "03-themes.sh"
    "04-settings.sh"
    "05-dock.sh"
    "06-extensions-config.sh"
    "07-terminal.sh"
    "08-dev-tools.sh"
    "99-finalize.sh"
)

# Track success/failure
failed_scripts=()
successful_scripts=()

# Run each script
for script in "${scripts[@]}"; do
    script_path="$SCRIPTS_DIR/$script"
    
    if run_script "$script_path"; then
        successful_scripts+=("$script")
    else
        failed_scripts+=("$script")
        
        # Ask user if they want to continue after a failure
        echo ""
        log_error "Script $script failed!"
        read -p "Continue with remaining scripts? (y/N): " continue_choice
        if [[ ! "$continue_choice" =~ ^[Yy]$ ]]; then
            log_warning "Setup interrupted by user."
            break
        fi
        echo ""
    fi
done

# Final summary
echo ""
echo -e "${CYAN}===============================${NC}"
echo -e "${CYAN}🏁 Setup Complete!${NC}"
echo -e "${CYAN}===============================${NC}"
echo ""

if [[ ${#successful_scripts[@]} -gt 0 ]]; then
    log_success "Successfully completed scripts:"
    for script in "${successful_scripts[@]}"; do
        echo -e "  ${GREEN}✅ $script${NC}"
    done
fi

if [[ ${#failed_scripts[@]} -gt 0 ]]; then
    echo ""
    log_warning "Failed scripts:"
    for script in "${failed_scripts[@]}"; do
        echo -e "  ${RED}❌ $script${NC}"
    done
    echo ""
    log_info "You can re-run individual failed scripts from the scripts/ directory"
fi

echo ""
log_info "📋 Post-installation checklist:"
echo "   • Log out and log back in to see all changes"
echo "   • On X11: restart GNOME Shell (Alt+F2, type 'r')"
echo "   • Install SF Pro font manually if desired"
echo "   • Configure GSConnect for Android device pairing"
echo "   • Some extensions may need additional manual configuration"
echo ""

# Optional: Logout prompt
if [[ ${#failed_scripts[@]} -eq 0 ]]; then
    read -p "🔄 Log out now to apply all changes? (y/N): " logout_choice
    if [[ "$logout_choice" =~ ^[Yy]$ ]]; then
        log_info "Logging out..."
        gnome-session-quit --logout --no-prompt
    fi
fi