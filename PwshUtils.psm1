Get-ChildItem $PSScriptRoot/Public/*.ps1 | ForEach-Object { . $_ }

Set-Alias shuf    Get-ShuffledItem
Set-Alias shuffle Get-ShuffledItem
Set-Alias lorem   Get-LoremIpsum