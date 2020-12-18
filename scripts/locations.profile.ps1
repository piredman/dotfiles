function go {
    param ( [string] $key )

    $machine = $env:COMPUTERNAME

    $locations = @{}
    switch ($machine) {
        Default {
            $locations = @{
                code    = 'f:\code'
                scripts = 'F:\code\dotfiles\scripts'
                edrpg   = 'F:\code\edrpg-app'
                web     = 'F:\code\edrpg-app\web'
                api     = 'F:\code\edrpg-app\api'
            }
        }
    }

    if (-Not ($locations.ContainsKey($key))) {
        Write-Host 'Known Locations'
        $locations.GetEnumerator() |
        Sort-Object -Property @{Expression = { $_.Value.length } } |
        Format-Table -HideTableHeaders -AutoSize
        Write-Host 'Usage: go <location>'
        return
    }

    $value = $locations[$key]
    set-location -Path $value
}