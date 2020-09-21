Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome\ExtensionInstallBlacklist" -Name "1" -Value "HIINFRASTRUCTURE"
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "BrowserAddPersonEnabled" -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "BrowserGuestModeEnabled" -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "SyncDisabled" -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisallowShaking" -Value 1 -Type DWord
Write-Host "Registry Updated."
