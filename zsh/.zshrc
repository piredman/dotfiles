# Include path to local bin directory
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Disable (devbox) prompt in devbox shell
export DEVBOX_NO_PROMPT=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh plugins
plugins=(
    git
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    web-search
)

source $ZSH/oh-my-zsh.sh

# Azue cli functions
use-azure-subscription() {
  if [ ! -n "$1" ]
  then
    echo 'command use requires azure subscription argument'
    return
  fi

  case "$1" in
    labs)
      echo 'az account set --subscription "DevFacto Labs"'
      az account set --subscription "DevFacto Labs"
      ;;
    clients)
      echo 'az account set --subscription "DevFacto Clients"'
      az account set --subscription "DevFacto Clients"
      ;;
    prod)
      echo 'az account set --subscription "DevFacto Production"'
      az account set --subscription "DevFacto Production"
      ;;
    *)
      echo 'unknown subscription'
      ;;
  esac
}

# Git functions
configure-git() {
  git config --global pager.branch false
}

git-log() {
  if [ -n "$1" ]
  then
    count=$1
  else
    count=5
  fi

  git --no-pager log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%ae>%Creset' --abbrev-commit --max-count $count
}

git-prune() {
  git remote prune origin;
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d;
}

git-rebase() {
    if [ -n "$1" ]
    then
      branch=$1
    else
      branch="main"
    fi

    echo "git remote update origin --prune"
    git remote update origin --prune
    echo
    echo "git fetch origin $branch --prune"
    git fetch origin $branch --prune
    echo
    echo "git rebase origin $branch"
    git rebase origin/$branch
}

# Git
alias {gl,glog}=git-log
alias {gp,gprune}=git-prune
alias {gs,gstatus}="git status"
alias {gr,grebase}=git-rebase
alias {gb,gbranch}="git branch"
alias {gw,gswitch}="git switch"
alias gamend="git commit --amend --cleanup=strip --date=\"$(date)\""
alias gtl="git worktree list"
alias gta="git worktree add"
alias gtar="git worktree add"
alias gtd="git worktree delete"

# azure
alias use=use-azure-subscription

# applications
alias vim=nvim
alias ls="eza --icons=always"
alias ll="eza -alh --icons=always"
alias tree="eza --tree"
alias cat="bat"
alias cd="z"
alias lg="lazygit"
alias ld="lazydocker"

# nvim mason applications
mason() {
  local command="$1"
  local file_path="$(pwd)/$2"
  shift 2
  (cd ~/.local/share/nvim/mason/bin && "./$command" "$file_path" "$@")
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# utility
alias reload="source ~/.zshrc"

# nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# start zoxide
eval "$(zoxide init zsh)"

# start starship
eval "$(starship init zsh)"
