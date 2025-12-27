# Load MSVC enviroment
function Set-DeveloperEnv
{
    param 
    (
        [string]$VsInstallPath = "C:\Program Files\Microsoft Visual Studio\2022\Community",
        [string]$Arch = "x64"
    )

    $modulePath = Join-Path $VsInstallPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll"

    # -ErrorAction Stop If the module fails to load, an error will be thrown, preventing further execution.
    Import-Module $modulePath -ErrorAction Stop

    # -VsInstallPath                    Specifies the installation path of Visual Studio to ensure the correct environment is set up.
    # -SkipAutomaticLocation            Prevents the module from trying to locate Visual Studio automatically, relying instead on the provided path.
    # -DevCmdArguments "-Arch=$Arch"    Passes additional arguments to the developer command prompt, in this case specifying the Architecture.
    Enter-VsDevShell -VsInstallPath $VsInstallPath -SkipAutomaticLocation -DevCmdArguments "-Arch=$Arch"
    Write-Host "[MSVC] Developer environment initialized for Architecture: $Arch" -Foreground Green
}
