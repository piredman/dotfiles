# Dotfiles

Modern, automated dotfiles for Arch Linux with Hyprland, Neovim, and developer tools.

## Quick Start

**Fresh Arch Linux Install (Bootstrap):**

```bash
curl -fsSL https://raw.githubusercontent.com/piredman/dotfiles/master/bootstrap | bash
```

**Existing System (Ongoing Configuration):**

```bash
git clone https://github.com/piredman/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup
```

**macOS:**

```bash
./install-osx.sh
```

## What's Included

### Window Manager & Desktop

- **Hyprland** - Modern Wayland compositor
- **Waybar** - Status bar with system info
- **Rofi** - Application launcher and dmenu
- **Dunst** - Notification daemon
- **Catppuccin Mocha** - Consistent theming

### Terminal & Shell

- **Zsh** - Modern shell with plugins
- **Starship** - Cross-platform prompt
- **WezTerm** - GPU-accelerated terminal
- **Tmux** - Terminal multiplexer

### Development Tools

- **Neovim** - Modern Vim with LSP support
- **Git** - Version control configuration
- **Yazi** - Modern file manager
- **Developer utilities** - bat, eza, ripgrep, fzf, lazygit

## System Requirements

- **Arch Linux** (primary support)
- **Paru** AUR helper
- **Git** for repository cloning

## Installation Details

The installation system is fully automated and modular:

- **Package management** - Organized by category in `install/config/`
- **Configuration sync** - Automatic symlink management
- **User groups** - Automatic addition to required system groups
- **Error handling** - Prerequisite validation and clear progress feedback
- **Package tracking** - Auto-generated `install/packages.txt`

See [`install/README.md`](install/README.md) for detailed technical documentation.

## Platform Support

| Platform   | Status           | Script             |
| ---------- | ---------------- | ------------------ |
| Arch Linux | ✅ Full Support  | `./setup`          |
| macOS      | 🚧 Basic Support | `./install-osx.sh` |

## Contributing

- Configuration follows existing patterns in each tool's directory
- Shell scripts use 4 spaces, functions use snake_case
- Lua code (Neovim) uses 2 spaces, follows .stylua.toml
- See [`AGENTS.md`](AGENTS.md) for development guidelines

## References

Inspiration and learning resources:

- [Josean Martinez Terminal Setup](https://www.josean.com/posts/terminal-setup)
- [ThePrimeagen Neovim Setup](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)
