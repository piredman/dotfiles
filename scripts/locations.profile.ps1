function go {
    param ( [string] $key )

    $locations = @{
        code = '/code';
        fit  = '/code/GeoFIT';
        sd   = '/code/GeoFIT/src/Fit/Shared/Data';
        sdm  = '/code/GeoFIT/src/Fit/Shared/DataMigrator';
        sod  = '/code/GeoFIT/src/Fit/ServiceOrders/Data';
        sodm = '/code/GeoFIT/src/Fit/ServiceOrders/DataMigrator';
        web  = '/code/GeoFIT/src/Fit/ServiceOrders/web/clientapp';
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