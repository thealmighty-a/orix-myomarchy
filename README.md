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
└── overrides/            # Omarchy/Hyprland overrides
    └── omarchy-overrides.conf
