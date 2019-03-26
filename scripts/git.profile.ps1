Import-Module -Name posh-git
Import-Module -Name oh-my-posh

# Alias
function start-gitRebase {
  git fetch origin master
  git rebase origin master
}
Set-Alias -Name gr -Value start-gitRebase

function get-gitLog($count = 5) {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count $count
}
del alias:gl -Force
Set-Alias -Name gl -Value get-gitLog

function start-gitPrune {
  git branch --merged | ? {$_[0] -ne '*'} | % {$_.trim()} | % {git branch -d $_}
}
Set-Alias -Name gprune -Value start-gitPrune

function start-gitStatus {
    git status
}
Set-Alias -Name gs -Value start-gitStatus
