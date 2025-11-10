#!/bin/sh

# Install additional applications on top of Omarchy defaults
# Omarchy already includes: Neovim, Git, Docker, Chromium, Spotify, Discord, etc.

echo "================================"
echo "Installing Additional Applications"
echo "================================"
echo ""

# List of apps to install
APPS=(
    # Browsers
    "firefox"              # Mozilla Firefox browser
    
    # Code Editors
    "cursor-bin"           # AI-powered code editor (AUR)
    "zed"                  # Zed editor (for themes)
    
    # File Managers
    "thunar"               # GTK file manager
    "thunar-volman"        # Removable device management for Thunar
    "thunar-archive-plugin" # Archive support for Thunar
    
    # Gaming
    "steam"                # Gaming platform
    "gdlauncher-bin"       # Custom Min
