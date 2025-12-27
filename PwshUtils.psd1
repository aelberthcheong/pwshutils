@{
    RootModule           = 'PwshUtils.psm1'
    ModuleVersion        = '1.0.0'
    CompatiblePSEditions = @('Core','Desktop')
    PowerShellVersion    = '7.0'

    Author               = 'Aelberth Cheong'
    Description          = 'Utility cmdlets most of them are based upon common Unix utility binaries.'

    FunctionsToExport    = @('Get-ShuffledItem', 'Get-LoremIpsum', 'Set-DeveloperEnv')
    AliasesToExport      = @('shuf', 'shuffle', 'lorem')

    PrivateData = @{
        PSData = @{
            Tags         = @('Utility','Unix','Random','Text')
            LicenseUri   = 'https://opensource.org/licenses/MIT'
            ProjectUri   = 'https://github.com/aelberthcheong/PwshUtils'
            ReleaseNotes = 'Initial release'
        }
    }
}
