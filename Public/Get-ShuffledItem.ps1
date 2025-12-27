function Get-ShuffledItem
{
    <#
    .SYNOPSIS
        Shuffles the given item(s) into a randomized order.

    .DESCRIPTION
        Accepts pipeline or parameter input and returns the items in random order.
        Strings are treated as sequences of characters.

        Use -Separator to return the Shuffled result as a string.
        Use -Seed for deterministic (same outcome) shuffling.

    .PARAMETER Item
        Item(s) to shuffle.

    .PARAMETER Separator
        Joins the Shuffled output using the given separator.

    .PARAMETER Seed
        Seed value for deterministic (same outcome) shuffling.

    .EXAMPLE 
        1..5 | Get-ShuffledItem
        4
        2
        1
        3
        5

    .EXAMPLE
        Get-ShuffledItem 6, 7, 8, 9, 0
        0
        9
        7
        6
        8

    .EXAMPLE
        "abcde" | Get-ShuffledItem
        a
        b
        d
        c
        e

    .EXAMPLE
        "abcde" | Get-ShuffledItem -Separator ""
        dcbae

    .EXAMPLE
        1..5 | Get-ShuffledItem -Separator ", "
        3, 1, 5, 2, 4

    .INPUTS
        System.Object

    .OUTPUTS
        System.Object[]
        System.String
    #>
    [CmdletBinding()]
    param 
    (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [object]$Item,
        [string]$Separator,
        [int]$Seed
    )

    begin
    { 
        $Buffer = @() 
    }

    process
    {
        if ($Item -is [string])
        { 
            $Buffer += $Item.ToCharArray()
        }
        else
        {
            $Buffer += $Item
        }
    }
    end
    {
        if ($Buffer.Count -eq 0) { return }
        if ($PSBoundParameters.ContainsKey('Seed'))
        {
            $Rng = [System.Random]::new($Seed)
            $Shuffled = $Buffer | Sort-Object { $Rng.Next() }
        }
        else
        {
            $Shuffled = Get-Random -Shuffle $Buffer
        }

        if ($PSBoundParameters.ContainsKey('Separator'))
        {
            $Shuffled -join $Separator
        }
        else
        {
            $Shuffled
        }
    }
}
