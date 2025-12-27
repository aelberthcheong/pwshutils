@{
    RootModule           = 'PwshUtils.psm1'
    ModuleVersion        = '1.0.0'
    GUID                 = '624a1a3b-67d6-4a1f-bd73-c62b821d703e'
    CompatiblePSEditions = @('Core','Desktop')
    PowerShellVersion    = '7.0'

    Author               = 'Aelberth Cheong'
    Description          = 'Utility cmdlets most of them are based upon common Unix utility binaries.'

    FunctionsToExport    = @('Get-ShuffledItem', 'Get-LoremIpsum', 'Set-DeveloperEnv')
    AliasesToExport      = @('shuf', 'shuffle', 'lorem')

    PrivateData = @{
        PSData = @{
            readme       = 'README.md'
            Tags         = @('Utility','Unix','Random','Text')
            LicenseUri   = 'https://opensource.org/licenses/MIT'
            ProjectUri   = 'https://github.com/aelberthcheong/PwshUtils'
            ReleaseNotes = 'Initial release'
        }
    }
}
