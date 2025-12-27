function Get-LoremIpsum
{
    <#
    .SYNOPSIS
        Generates Lorem Ipsum text.

    .DESCRIPTION
        Returns random Lorem Ipsum Words as a sentence.
        Use -Seed for deterministic output.
        Use -AsArray to return Words instead of a string.

    .PARAMETER Count
        Number of Words to generate.

    .PARAMETER Seed
        Seed value for deterministic (same outcome) output.

    .PARAMETER AsArray
        Return Words as an array of string.

    .EXAMPLE
        Get-LoremIpsum -Count 10
        lorem ipsum dolor sit amet culpa quis elit nostrud do.

    .OUTPUTS
        System.String
        System.Array
    #>
    [CmdletBinding()]
    param 
    (
        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$Count,
        [int]$Seed,
        [switch]$AsArray
    )

    $Words = @(
        'lorem','ipsum','dolor','sit','amet','culpa','quis','elit','nostrud','do','et','ex',
        'enim','pariatur','duis','sunt','deserunt','ea','commodo','occaecat','mollit',
        'excepteur','proident','fugiat','qui','adipiscing','magna','voluptate','cillum',
        'nulla','dolore','laboris','velit','cupidatat','non','nisi','sint','ullamco',
        'tempor','veniam','irure','esse','anim','in','aute','eu','ut','consectetur',
        'labore','laborum','aliqua','exercitation','sed','ad','incididunt','minim',
        'reprehenderit','aliquip','est','officia','consequat','id','eiusmod'
    )

    $Rng = if ($PSBoundParameters.ContainsKey('Seed')) {
        [System.Random]::new($Seed)
    }

    $Result = for ($i = 0; $i -lt $Count; $i++)
    {
        if ($Rng) 
        {
            $Words[$Rng.Next(0, $Words.Length)]
        }
        else
        {
            $RandomIndex = Get-Random -Minimum 0 -Maximum $Words.Length
            $Words[$RandomIndex]
        }
    }

    if ($AsArray)
    {
        return $Result
    }

    ($Result -join ' ') + '.'
}