<#
.SYNOPSIS
    Gets VSCode project KeyBinding
.DESCRIPTION
    Gets the project KeyBindings from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetProjectKeyBindings
.EXAMPLE
    PowerCode -GetProjectKeyBinding
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current projects's KeyBindings.
[Parameter(Mandatory)]
[Alias('GetProjectKeyBinding')]
[switch]
$GetProjectKeyBindings
)


PowerCode -NearestVSCodeDirectory |
    Get-ChildItem -Filter keybindings.json |
    & { process {
        [IO.File]::ReadAllText($_.Fullname) | 
        ConvertFrom-Json |
        ForEach-Object {
            $vsCodeKeybinding = $_
            $vsCodeKeybinding.pstypenames.insert(0, 'VSCode.Keybinding')
            $vsCodeKeybinding            
        }
    } }