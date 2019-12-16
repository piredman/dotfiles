Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome\ExtensionInstallBlacklist" -Name "1" -Value "HIINFRASTRUCTURE"
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "BrowserAddPersonEnabled" -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "BrowserGuestModeEnabled" -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Policies\Google\Chrome" -Name "SyncDisabled" -Value 0 -Type DWord