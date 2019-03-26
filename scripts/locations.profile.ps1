function go {
  param ( [string] $key )

  $locations = @{
    code = '/code';
    fit = '/code/FIT';
    sd = '/code/FIT/src/Fit/Shared/Data';
    sdm = '/code/FIT/src/Fit/Shared/DataMigrator';
    sod = '/code/FIT/src/Fit/ServiceOrders/Data';
    sodm = '/code/FIT/src/Fit/ServiceOrders/DataMigrator';
    web = '/code/FIT/src/Fit/ServiceOrders/web/clientapp';
  }

  if (-Not ($locations.ContainsKey($key))) {
    Write-Host 'Known Locations'
    $locations.GetEnumerator() |
      Sort-Object -Property @{Expression = {$_.Value.length}} |
      Format-Table -HideTableHeaders -AutoSize
    Write-Host 'Usage: go <location>'
    return
  }

  $value = $locations[$key]
  set-location -Path $value
}