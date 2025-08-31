# Agent Instructions for Dotfiles Repository

## Build/Lint/Test Commands
- No package.json - this is a dotfiles configuration repository
- Install: `./setup` (Arch Linux) or `./install-osx.sh` (macOS)
- Lua formatting (Neovim config): `stylua nvim/` (follows .stylua.toml config)
- No test suite - configurations are validated through installation
- Package management: Uses `paru` (AUR helper) and `pacman` on Arch Linux

## Code Style Guidelines

### Shell Scripts (.sh, setup files)
- Use `#!/usr/bin/env bash` shebang
- 4 spaces for indentation
- Functions use snake_case naming (e.g., `print_section`, `create_symlink`)
- Variables use UPPER_CASE for exports, lower_case for locals
- Error handling with explicit checks and meaningful error messages
- Source utility libraries from `install/lib/` and `zsh/scripts/`

### Lua (Neovim config)
- 2 spaces indentation (per .stylua.toml)
- Single quotes preferred for strings
- Column width: 160 characters
- No call parentheses for single string arguments
- Use require() for imports, organize by external/internal
- Return table structure for plugin configurations

### Configuration Files
- Use descriptive comments with consistent formatting
- Follow existing patterns in each config type (TOML, JSON, YAML)
- Maintain consistency with upstream tool conventions
- Symlink configurations to appropriate locations in $HOME/.config/