Import-Module -Name posh-git
Import-Module -Name oh-my-posh

# Alias
function start-gitRebase {
  Write-Host git remote update origin --prune -ForegroundColor DarkCyan
  git remote update origin --prune
  
  Write-Host git fetch origin master --prune -ForegroundColor DarkCyan
  git fetch origin master --prune
  Write-Host git rebase origin master -ForegroundColor DarkCyan
  git rebase origin master
}
Set-Alias -Name grebase -Value start-gitRebase
Set-Alias -Name gr -Value start-gitRebase

function get-gitLog($count = 5) {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count $count
}
del alias:gl -Force
Set-Alias -Name glog -Value get-gitLog
Set-Alias -Name gl -Value get-gitLog

function start-gitPrune {
  git branch --merged | ? { $_[0] -ne '*' } | % { $_.trim() } | % { git branch -d $_ }
}
Set-Alias -Name gprune -Value start-gitPrune
  
function start-gitStatus {
  git status
}
Set-Alias -Name gstatus -Value start-gitStatus
Set-Alias -Name gs -Value start-gitStatus
  
function start-gitBranch {
  git branch
}
Set-Alias -Name gbranch -Value start-gitBranch
Set-Alias -Name gb -Value start-gitBranch

function start-gitAmend {
  git commit --amend --date="$(date)"
}
Set-Alias -Name gAmend -Value start-gitAmend
Set-Alias -Name ga -Value start-gitAmend