# ORIX
# My Omarchy Configuration

Personal dotfiles, themes, scripts, and configurations for Omarchy (Arch Linux + Hyprland).

## 📁 Repository Structure

```
my-omarchy/
├── scripts/              # Installation scripts
│   ├── install-all.sh           # 🚀 Master installer (run this!)
│   ├── install-stow.sh          # Installs GNU Stow
│   ├── install-apps.sh          # Installs additional applications
│   ├── install-dotfiles.sh      # Symlinks dotfiles
│   └── install-overrides.sh     # Applies Omarchy overrides
│
├── themes/               # Downloaded and custom themes
│   └── .config/
│       └── (theme files)
│
├── configs/              # Your configuration files
│   └── .config/
│       ├── waybar/              # Waybar configs
│       ├── nvim/                # Neovim configs
│       ├── fastfetch/           # Fastfetch configs
│       └── ...                  # Other configs
│
├── bin/                  # Custom scripts and utilities
│   └── .local/
│       └── bin/
│           ├── waybar-theme-switcher.sh    # Theme menu script
│           ├── set-default-browser.sh      # Set Firefox as default
│           └── set-default-filemanager.sh  # Set Thunar as default
│
├── overrides/            # Omarchy/Hyprland overrides
│   ├── omarchy-overrides.conf    # Main overrides file
│   ├── desktop-monitors.conf     # Desktop monitor setup
│   └── laptop-monitors.conf      # Laptop monitor setup
```

## 🚀 Quick Start (New Machine)

1. **Clone this repository:**
   ```bash
   git clone https://github.com/thealmighty-a/my-omarchy.git
   cd my-omarchy/scripts
   ```

2. **Make scripts executable:**
   ```bash
   chmod +x *.sh
   ```

3. **Run the master installer:**
   ```bash
   ./install-all.sh
   ```

That's it! Everything will be installed and configured automatically.

## 📦 What Omarchy Already Includes

Omarchy comes with a ton of apps pre-installed:
- **Development**: Neovim (LazyVim), Git, GitHub CLI, Docker, Lazydocker, Lazygit
- **Browsers**: Chromium
- **Terminal**: Alacritty
- **Productivity**: LibreOffice, Obsidian, Typora, 1Password, Signal, Discord
- **Media**: Spotify, Pinta
- **Tools**: fzf, ripgrep, zoxide, btop, htop, LocalSend

## 📝 Additional Apps We Install

This repo adds these apps on top of Omarchy defaults:
- **Browsers**: Firefox
- **Editors**: Cursor, Zed
- **File Manager**: Thunar
- **Gaming**: Steam, GDLauncher (Minecraft)
- **Media**: VLC, Spicetify (Spotify themes)
- **Communication**: Vesktop (Discord with Vencord)
- **Design**: GIMP, Scribus
- **System**: Fastfetch
- **Compatibility**: Wine & Winetricks
- **Waybar**: [Auto Waybar Switch](https://github.com/Palccod/Omarchy-auto-waybar-switch) - Theme switcher with keybind

### 🔧 Adding More Apps Later

To add a new application:

1. **Edit `scripts/install-apps.sh`**
2. **Add your app to the `APPS` array:**
   ```bash
   APPS=(
       # ... existing apps ...
       "your-new-app"      # Description
   )
   ```
3. **Run the script again:**
   ```bash
   ./scripts/install-apps.sh
   ```

**Finding package names:**
```bash
# Search for a package
yay -Ss package-name

# Get package info
yay -Si package-name
```

## 🎨 Theme Management

### Downloaded Themes
Place downloaded themes in `themes/.config/omarchy/`:
```bash
themes/
└── .config/
    └── omarchy/
        ├── theme-name-1/
        └── theme-name-2/
```

### Waybar Theme Switcher
Your custom waybar theme switcher script will be in `bin/.local/bin/waybar-theme-switcher.sh`

After adding themes or scripts:
```bash
cd ~/my-omarchy
git add themes/ bin/
git commit -m "Add new themes and scripts"
git push
```

## ⚙️ Configuration Files (Dotfiles)

Your configs live in the `configs/` directory following this structure:

```
configs/.config/APP_NAME/config-file
```

**Examples:**

**Waybar:**
```
configs/.config/waybar/
├── config
└── style.css
```

**Fastfetch:**
```
configs/.config/fastfetch/
└── config.jsonc
```

**Neovim:**
```
configs/.config/nvim/
└── init.lua
```

After adding configs:
```bash
cd ~/my-omarchy
stow -t "$HOME" configs
```

## 🔧 Custom Scripts

Put your scripts in `bin/.local/bin/`:

```bash
bin/
└── .local/
    └── bin/
        ├── waybar-theme-switcher.sh
        ├── set-default-browser.sh      # Set Firefox as default
        └── set-default-filemanager.sh  # Set Thunar as default
```

After adding scripts:
```bash
cd ~/my-omarchy
stow -t "$HOME" bin
chmod +x ~/.local/bin/*.sh
```

## 🎛️ Omarchy Overrides

### Multi-Device Monitor Setup

This repo supports different monitor configurations for laptop and desktop:

**Files:**
- `overrides/omarchy-overrides.conf` - Main overrides (keybinds, appearance, etc.)
- `overrides/desktop-monitors.conf` - Desktop dual monitor setup
- `overrides/laptop-monitors.conf` - Laptop single monitor setup

**Setup:**
1. Find your hostnames by running `hostname` on each device
2. Edit `overrides/omarchy-overrides.conf` and update:
   - Replace `your-desktop-hostname` with your actual desktop hostname
   - Replace `your-laptop-hostname` with your actual laptop hostname
3. The correct monitor config will load automatically!

### Desktop Monitor Setup
```conf
# Desktop: Dual 1920x1080 @ 100Hz
env = GDK_SCALE,1
monitor = DP-3, 1920x1080@100, 0x0, 1       # Left monitor
monitor = HDMI-A-1, 1920x1080@100, 1920x0, 1  # Right monitor
```

### Laptop Monitor Setup
```conf
# Laptop: Auto-detect built-in display
monitor = ,preferred,auto,1
```

### Custom Settings Examples

**Keybinds:**
```conf
bind = SUPER, B, exec, firefox
bind = SUPER, E, exec, thunar
```

**Appearance:**
```conf
general {
    gaps_in = 5
    gaps_out = 10
}
```

Reload Hyprland to apply changes (usually `Super+Shift+R`).

## 🔄 Syncing Across Devices

**Pull latest changes:**
```bash
cd ~/my-omarchy
git pull
```

**Push your changes:**
```bash
cd ~/my-omarchy
git add .
git commit -m "Updated configs"
git push
```

## 🛠️ How GNU Stow Works

Stow creates **symlinks** from your repo to your home directory:

```
~/.config/waybar/config → ~/my-omarchy/configs/.config/waybar/config
```

**Benefits:**
- ✅ Edit once in the repo, changes appear everywhere
- ✅ All configs are version controlled
- ✅ Easy to sync across machines
- ✅ No manual copying needed

## 🗑️ Uninstalling

To remove symlinks (doesn't delete your repo):
```bash
cd ~/my-omarchy
stow -D themes configs bin
```

## 🆘 Troubleshooting

**Stow conflicts?**
- Backup existing configs: `mv ~/.config/APP ~/.config/APP.backup`
- Then run stow again

**Script not executable?**
```bash
chmod +x script-name.sh
```

**Want to see what stow will do?**
```bash
stow -n -v themes  # Dry run with verbose output
```

**App installation failed?**
```bash
# Install manually
yay -S app-name

# Check if app exists
yay -Ss app-name
```

## 📚 Resources

- [GNU Stow Documentation](https://www.gnu.org/software/stow/)
- [Omarchy](https://github.com/omakub/omakub)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Arch Wiki](https://wiki.archlinux.org/)

## 📄 License

Personal configuration - feel free to use as reference!
