# home
ln -s ~/code/personal/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/code/personal/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/code/personal/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

# .config
ln -s ~/code/personal/dotfiles/nvim ~/.config/nvim
ln -s ~/code/personal/dotfiles/starship/starship.toml ~/.config/starship.toml

# vscode
ln -s ~/code/personal/dotfiles/vscode/settings.json "/Users/paulredman/Library/Application Support/Code/User/settings.json"
ln -s ~/code/personal/dotfiles/vscode/keybindings.json "/Users/paulredman/Library/Application Support/Code/User/keybindings.json"

# icloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/icloud
ln -s ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ ~/obsidian

# fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
