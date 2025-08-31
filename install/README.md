# Arch Linux Dotfiles Installation System

## System Overview

A modular, well-organized installation system for Arch Linux dotfiles with robust error handling, prerequisite validation, and clean console output formatting.

## File Structure

```
install/
├── lib/                         # Core utilities (sourced by all scripts)
│   ├── install-utils            # Printing functions, prerequisites, environment validation
│   ├── package-utils            # Package installation & config file loading
│   └── symlink-utils            # Symlink creation and management
├── scripts/                     # Standalone utility scripts
│   ├── check-multilib           # Validates multilib repository
│   └── enable-multilib          # Enables multilib repository
├── config/                      # Package configuration files
│   ├── core-packages.conf       # Essential system packages
│   ├── hypr-packages.conf       # Hyprland window manager packages
│   ├── theme-packages.conf      # Theme and appearance packages
│   └── dolphin-packages.conf    # File manager packages
└── packages.txt                 # List of all installed packages, output of `paru -Q`

zsh/scripts/shell-utils          # General shell utilities (run_script function)
```

## TODO

- Automate enabling cups, check to see if it's already enabled and active, requires sudo

```bash
> sudo systemctl enable --now cups
```

- Run hp-setup. The command bellow uses interactive mode, the automation can't use this. It needs to select network printer mode. The printer will need to be online and attached to the network for this to work. It asked a lot of questions about the printer, might be manual.

```bash
> sudo hp-setup -i
```

## Key Components

### Main Entry Point

- `setup` - Primary installation script that orchestrates the entire process

### Core Library Functions (`install/lib/install-utils`)

- `print_section()` - Section headers with `==> ` prefix
- `print_success()` - Success messages with `✓ ` prefix
- `print_step()` - Step indicators (avoid using - prefer print_success after completion)
- `check_prerequisites()` - Validates required tools (paru, git, curl, pacman)
- `validate_environment()` - Checks required environment variables

### Package Management (`install/lib/package-utils`)

- `load_package_config()` - Loads package lists from .conf files
- `install_packages()` - Installs packages with individual success reporting

### Symlink Management (`install/lib/symlink-utils`)

- `create_symlink()` - Creates symlinks with success reporting and category labels

## Installation Flow (Sequential)

1. **Prerequisites & Environment** - Tool validation and environment setup
2. **Library Setup** - Source all utility libraries
3. **Pacman Configuration** - Enable multilib repository if needed
4. **Core Packages** - Install essential system packages
5. **Shell & Terminal** - Configure git, zsh, tmux
6. **Applications** - Configure wezterm, nvim, starship, yazi
7. **Hyprland Setup** - Install and configure window manager components
8. **Theme Setup** - Install and configure GTK/Qt themes
9. **File Manager Setup** - Configure Dolphin with custom actions
10. **DevPod Setup** - Configure development container tool

## Configuration Management

- **Package lists** stored in separate `.conf` files in `install/config/`
- **Environment variables** required: `$SCRIPT_DIR`, `$DOTFILES_DIR`, `$LIB_DIR`, `$XDG_CONFIG_HOME`
- **Host-specific configs** supported (e.g., `hyprland-${hostname}.conf`)

## Console Output Standards

- **Sections**: `==> Section Name`
- **Success**: `  ✓ Item name`
- **Avoid**: `print_step()` without follow-up `print_success()`
- **Consistency**: All actions should show success checkmarks, not step indicators

## Development Notes

- **All setup scripts** source from `$LIB_DIR` for consistency
- **Package installation** uses individual success reporting for each package
- **Symlink creation** includes category labels for organization
- **Error handling** includes validation before execution
- **Environment validation** runs once at start to avoid duplication
- **Sequential execution** ensures clean, ordered console output
