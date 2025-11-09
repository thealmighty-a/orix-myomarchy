#!/bin/sh

# Master installation script
# This runs all installation scripts in order

echo "================================"
echo "Omarchy Setup - Master Installer"
echo "================================"
echo ""
echo "This script will:"
echo "  1. Install GNU Stow (for dotfile management)"
echo "  2. Install all your applications"
echo "  3. Install Waybar theme switcher"
echo "  4. Install and symlink your dotfiles"
echo "  5. Apply Omarchy overrides"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Step 1: Install Stow
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 1/4: Installing GNU Stow"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$SCRIPT_DIR/install-stow.sh" ]; then
    . "$SCRIPT_DIR/install-stow.sh"
else
    echo "⚠ install-stow.sh not found, skipping..."
fi

# Step 2: Install Apps
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 2/4: Installing Applications"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$SCRIPT_DIR/install-apps.sh" ]; then
    . "$SCRIPT_DIR/install-apps.sh"
else
    echo "⚠ install-apps.sh not found, skipping..."
fi

# Step 3: Install Dotfiles
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 3/4: Installing Dotfiles"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$SCRIPT_DIR/install-dotfiles.sh" ]; then
    . "$SCRIPT_DIR/install-dotfiles.sh"
else
    echo "⚠ install-dotfiles.sh not found, skipping..."
fi

# Step 4: Install Overrides
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 4/4: Installing Omarchy Overrides"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$SCRIPT_DIR/install-overrides.sh" ]; then
    . "$SCRIPT_DIR/install-overrides.sh"
else
    echo "⚠ install-overrides.sh not found, skipping..."
fi

# Final message
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ All installations complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "  • Your dotfiles are in ~/my-omarchy"
echo "  • Edit configs there, changes reflect immediately"
echo "  • Reload Hyprland with Super+Shift+R (or your keybind)"
echo "  • Customize overrides in ~/my-omarchy/overrides/"
echo ""
echo "To update from GitHub: cd ~/my-omarchy && git pull"
echo "To push changes: cd ~/my-omarchy && git add . && git commit -m 'update' && git push"
