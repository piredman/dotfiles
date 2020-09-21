function go {
    param ( [string] $key )

    $machine = $env:COMPUTERNAME

    $locations = @{}
    switch ($machine) {
        'DESKTOP-6FOKVOL' {
            $locations = @{
                code    = 'f:\code'
                scripts = 'F:\code\dotfiles\scripts'
                edrpg   = 'F:\code\edrpg-app'
                web     = 'F:\code\edrpg-app\web'
                api     = 'F:\code\edrpg-app\api'
            }
        }
        'WORK-MACHINE' {
            $locations = @{                
                code    = '/code';
                scripts = '/code/dotfiles/scripts';
                fit     = '/code/GeoFIT';
                sd      = '/code/GeoFIT/src/Fit/Shared/Data';
                sdm     = '/code/GeoFIT/src/Fit/Shared/DataMigrator';
                sod     = '/code/GeoFIT/src/Fit/ServiceOrders/Data';
                sodm    = '/code/GeoFIT/src/Fit/ServiceOrders/DataMigrator';
                web     = '/code/GeoFIT/src/Fit/ServiceOrders/web/clientapp';
                edrpg   = '/code/edrpg-app';
            }
        }
        Default {}
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