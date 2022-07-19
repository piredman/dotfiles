function go {
    param ( [string] $key )

    $machine = $env:COMPUTERNAME

    $locations = @{}
    switch ($machine) {
        Default {
            $locations = @{
                code    = 'f:\code'
                scripts = 'F:\code\dotfiles\scripts'
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