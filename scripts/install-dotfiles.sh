#!/bin/sh

# Install dotfiles using GNU Stow
# This script clones your dotfiles repo and symlinks everything to your home directory

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_URL="https://github.com/thealmighty-a/orix-myomarchy.git"
REPO_NAME="orix-myomarchy"

# Check if stow is installed
check_stow() {
    if ! command -v stow >/dev/null 2>&1; then
        echo "Error: GNU Stow is not installed."
        echo "Please run install-stow.sh first or install it with:"
        echo "  yay -S --noconfirm --needed stow"
        exit 1
    fi
    echo "✓ GNU Stow is installed"
}

# Clone the repository if it doesn't exist
clone_repo() {
    if [ ! -d "$HOME/$REPO_NAME" ]; then
        echo "Cloning dotfiles repository..."
        git clone "$REPO_URL" "$HOME/$REPO_NAME"
        if [ $? -eq 0 ]; then
            echo "✓ Repository cloned successfully"
        else
            echo "✗ Failed to clone repository"
            exit 1
        fi
    else
        echo "Repository already exists, pulling latest changes..."
        cd "$HOME/$REPO_NAME" && git pull
        echo "✓ Repository updated"
    fi
}

# Backup existing configs
backup_configs() {
    echo "Backing up existing configurations..."
    BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
    
    # Add any specific configs you want to backup
    if [ -d "$HOME/.config/nvim" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$HOME/.config/nvim" "$BACKUP_DIR/"
        echo "✓ Backed up nvim config to $BACKUP_DIR"
    fi
}

# Install dotfiles using stow
install_dotfiles() {
    cd "$HOME/$REPO_NAME" || exit 1
    
    echo "Installing dotfiles with GNU Stow..."
    
    # Stow each directory (add/remove as needed for your setup)
    for dir in themes scripts configs; do
        if [ -d "$dir" ]; then
            echo "Stowing $dir..."
            stow -t "$HOME" "$dir"
            if [ $? -eq 0 ]; then
                echo "✓ $dir stowed successfully"
            else
                echo "✗ Failed to stow $dir"
            fi
        else
            echo "⚠ Directory $dir not found, skipping..."
        fi
    done
    
    echo ""
    echo "✓ Dotfiles installed successfully!"
    echo "Your configs are now symlinked from $HOME/$REPO_NAME"
}

# Main execution
main() {
    echo "================================"
    echo "Dotfiles Installation Script"
    echo "================================"
    echo ""
    
    check_stow
    clone_repo
    backup_configs
    install_dotfiles
    
    echo ""
    echo "================================"
    echo "Installation Complete!"
    echo "================================"
    echo ""
    echo "Your dotfiles are now managed by Stow."
    echo "Edit files in $HOME/$REPO_NAME and changes will reflect immediately."
    echo ""
    echo "To uninstall, run: cd $HOME/$REPO_NAME && stow -D themes scripts configs"
}

main
