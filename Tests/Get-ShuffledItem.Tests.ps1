Import-Module "$PSScriptRoot/../PwshUtils.psd1" -Force

Describe 'Get-ShuffledItem' {
    It 'returns same order with same seed' {
        $a = 1..5 | Get-ShuffledItem -Seed 67
        $b = 1..5 | Get-ShuffledItem -Seed 67
        $a | Should -Be $b
    }

    It 'joins output when separator is specified' {
        "abc" | Get-ShuffledItem -Separator '' | Should -Match '^[abc]{3}$'
    }
}