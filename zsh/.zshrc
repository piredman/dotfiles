# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob

path=(
  $path                         # Keep existing PATH entries
  $HOME/bin
  $HOME/.local/bin
  $HOME/.rd/bin                 # Rancher Desktop
  /usr/local/bin
  /opt/homebrew/bin
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


export EDITOR=nvim

# Use fd as fzf default
export FZF_DEFAULT_COMMAND='fd'

# Move ruby configuration into a devcontainer
#
# # ruby
# if uname -r | grep -q 'arch'; then
#   export GEM_HOME="$(gem env user_gemhome)"
#   export PATH="$PATH:$GEM_HOME/bin"
# fi
# if uname | grep -q 'Darwin'; then # macos
#   export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#   export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
#   export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
# fi


# ~~~~~~~~~~~~~~~ oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh plugins
plugins=(
    git
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh


# ~~~~~~~~~~~~~~~ git configuraiton ~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

# This will delete the local branches for which the remote tracking branches have been pruned. (Make sure you are on master branch!)
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

alias {gl,glog}=git-log
alias {gp,gprune}=git-prune
alias {gs,gstatus}="git status"
alias {gr,grebase}=git-rebase
alias {gb,gbranch}="git branch"
alias {gw,gswitch}="git switch"
alias {gstash}="git stash"
alias {gpop}="git stash pop"
alias gamend="git commit --amend --cleanup=strip --date=\"$(date)\""
alias gtl="git worktree list"
alias gta="git worktree add"
alias gtd="git worktree delete"


# ~~~~~~~~~~~~~~~ aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# applications
alias vim=nvim
alias ls="eza --icons=always"
alias ll="eza -alh --icons=always"
alias tree="eza --tree"
alias cat="bat"
alias cd="z"
alias lg="lazygit"
alias ld="lazydocker"
alias sdk="/home/redman/.local/share/Steam/steamapps/common/SteamOSDevkitClient/devkit-gui.sh"
alias devpod="devpod-cli"

# kubectl
alias k="kubectl"
alias kgp="kubectl get pods"

# linux only
if uname -r | grep -q 'arch'; then
  alias ff="fastfetch"
  alias stats="fastfetch"
  alias ffip="fastfetch -c ~/.config/fastfetch/ip.jsonc"
fi

# utility
alias reload="source ~/.zshrc"


# ~~~~~~~~~~~~~~~ functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# nvim mason applications
function mason() {
  local command="$1"
  local file_path="$(pwd)/$2"
  shift 2
  (cd ~/.local/share/nvim/mason/bin && "./$command" "$file_path" "$@")
}

# open yazi
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# aerospace(macos): list workspace applications & move to selection
function sf() {
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}


# ~~~~~~~~~~~~~~~ sourcing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# start zoxide
eval "$(zoxide init zsh)"

# start starship
eval "$(starship init zsh)"
