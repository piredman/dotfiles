[CmdletBinding()]
param(
  [parameter(Mandatory = $true, Position = 1)][string]$FileName,
  [parameter(Mandatory = $true, Position = 2)][string]$GroupName
)
cls
import-module ActiveDirectory

$users = Get-Content .\$FileName
$group = Get-ADGroup -Identity $GroupName
$groupDN = $group.DistinguishedName

"Group DN: $groupDN"

foreach ($user in $users) {
  $userDetails = Get-ADUser -Identity $user -Properties MemberOf
  if ($userDetails -eq $null) {
    ("{0}: Does not exist" -f $user)
  } 
  else {
    $inGroup = $userDetails.MemberOf | Where-Object { $_.Contains($groupDN) }
    if ($inGroup -ne $null) {
      ("{0}: Is Member of {1}" -f $user, $GroupName)
    }
    else {
      ("{0}: Is NOT a Member of {1}" -f $user, $GroupName)
    }
  }
}