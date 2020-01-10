cd C:\code\GeoFIT\src
Get-ChildItem .\ -include bin,obj -Recurse | ? { $_.FullName -inotmatch 'node_modules' } | foreach ($_) { Write-Host Removing $_; remove-item $_.fullname -Force -Recurse }