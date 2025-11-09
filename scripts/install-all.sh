#!/bin/sh

# Master installation script
# This runs all installation scripts in order

echo "================================"
echo "Omarchy Setup - Master Installer"
echo "================================"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source and run each installation script
echo "Step 1: Installing GNU Stow..."
. "$SCRIPT_DIR/install-stow.sh"

echo ""
echo "Step 2: Installing dotfiles..."
. "$SCRIPT_DIR/install-dotfiles.sh"

echo ""
echo "================================"
echo "All installations complete!"
echo "================================"
echo ""
echo "You can now customize your setup by editing files in ~/my-omarchy"
echo "Any changes will be reflected immediately via symlinks."
