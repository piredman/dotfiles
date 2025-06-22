# ~~~~~~~~~~~~~~~ path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob
typeset -U path

add_to_path() {
    [[ $# -eq 0 ]] && return 0
    local new_path="${1/#\~/$HOME}"
    [[ -d "$new_path" ]] || return 1
    path=("$new_path" $path)
}

my_paths=(
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  $HOME/bin
  $HOME/.local/bin
)

expanded_paths=(${my_paths/#\~/$HOME})
path=(${^expanded_paths:A}(N-/) $path)

export PATH


# ~~~~~~~~~~~~~~~ environment variables ~~~~~~~~~~~~~~~~~~~~~~~~

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export EDITOR=nvim                          # neovim is the default editor
export FZF_DEFAULT_COMMAND='fd'             # fd as fzf default

[ -f ~/.env_vars ] && source ~/.env_vars


# ~~~~~~~~~~~~~~~ homebrew ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ -d "/opt/homebrew" ]]; then
  add_to_path /opt/homebrew/bin
  add_to_path /opt/homebrew/opt/{coreutils,findutils,gawk}/libexec/gnubin
fi


# ~~~~~~~~~~~~~~~ oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  plugins=(
      git
      docker
      zsh-autosuggestions
      zsh-syntax-highlighting
      zsh-fzf-history-search
      zsh-vi-mode
  )
  source $HOME/.oh-my-zsh/oh-my-zsh.sh
fi


# ~~~~~~~~~~~~~~~ rancher desktop ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ -d "$HOME/.rd" ]]; then
  add_to_path $HOME/.rd/bin

  if [[ "$(uname)" == "Darwin" ]]; then
      export LIMA_HOST_IP=192.168.5.2
  fi
fi


# ~~~~~~~~~~~~~~~ git configuraiton ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
alias fsb="~/scripts/fsb"


# ~~~~~~~~~~~~~~~ aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# applications
alias v=nvim
alias vim=nvim
alias ls="eza --icons=always"
alias ll="eza -lh --icons=always --git"
alias la="eza -lahr --icons=always --sort modified"
alias lla="eza -lah --icons=always --git"
alias lt="eza --tree"
alias cat="bat"
alias cd="z"
alias lg="lazygit"
alias ld="lazydocker"
alias steamkit="$HOME/.local/share/Steam/steamapps/common/SteamOSDevkitClient/devkit-gui.sh"
alias dp="devpod-cli"
alias devpod="devpod-cli"

# linux only
if uname -r | grep -q 'arch'; then
  alias ff="fastfetch"
  alias stats="fastfetch"
  alias ffip="fastfetch -c ~/.config/fastfetch/ip.jsonc"
fi

# utility
alias reload="source ~/.zshrc"


# ~~~~~~~~~~~~~~~ functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function yy() {
  # open yazi
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function select-workspace() {
  # aerospace(macos): list workspace applications & move to selection
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}
alias sw=select-workspace


# ~~~~~~~~~~~~~~~ sourcing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if command -v zoxide > /dev/null ; then
  # start zoxide
  eval "$(zoxide init zsh)"
fi

if command -v starship > /dev/null ; then
  # start starship
  eval "$(starship init zsh)"
fi

if command -v fnm > /dev/null ; then
  # Switches to the correct node version when you enter a directory with a .node-version or .nvmrc file
  eval "$(fnm env --use-on-cd)"
fi

if command -v asdf > /dev/null ; then
  # enable asdf
  . "$HOME/.asdf/asdf.sh"
fi
