Get-ChildItem $PSScriptRoot/Public/*.ps1 | ForEach-Object { . $_ }
Get-ChildItem $PSScriptRoot/Private/*.ps1 | ForEach-Object { . $_ }

Set-Alias shuf    Get-ShuffledItem
Set-Alias shuffle Get-ShuffledItem
Set-Alias lorem   Get-LoremIpsum

Export-ModuleMember `
    -Function Get-ShuffledItem, Get-LoremIpsum, Set-DeveloperEnv `
    -Alias shuf, shuffle, lorem
