$scriptsFolder = '/code/scripts'
$profileFileTemplate = '*.profile.ps1'
Get-ChildItem "${scriptsFolder}\${profileFileTemplate}" | %{
    write-host "Loading $_"
    .$_
}