# PwshUtils

![CI](https://github.com/aelberthcheong/pwshutils/actions/workflows/ci.yml/badge.svg)

Some common PowerShell utility cmdlets, most are based upon common unix utility binaries.

## Requirements
- PowerShell 7+

## Installation

#### PowerShell Gallery
```powershell
Install-Module PwshUtils -Scope CurrentUser
```

#### Source
```powershell
git clone "https://github.com/aelberthcheong/pwshutils"
Import-Module ./PwshUtils/PwshUtils.psd1
```
For persistent availability, place the module in a directory listed in `$env:PSModulePath`,
for example:
- `$HOME\Documents\PowerShell\Modules` (recommended for current user)
- `$env:ProgramFiles\PowerShell\Modules` (system-wide, requires admin)

## CmdLets
- `Get-ShuffledItem` -- Shuffle pipeline input
- `Get-LoremIpsum`   -- Generate Lorem Ipsum text