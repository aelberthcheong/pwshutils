Describe 'Get-LoremIpsum' {
    It 'returns same words with same seed' {
        $a = Get-LoremIpsum -Count 10 -Seed 67
        $b = Get-LoremIpsum -Count 10 -Seed 67
        $a | Should -Be $b
    }

    It 'Output should be an array' {
        $a = Get-LoremIpsum -Count 10 -AsArray
        $a | Should -BeOfType '[string]'
    }
}