<#
.SYNOPSIS
    Gets VSCode user KeyBinding
.DESCRIPTION
    Gets the user KeyBindings from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetUserKeyBinding
.EXAMPLE
    PowerCode -GetUserKeyBindings
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current user's KeyBindings.
[Parameter(Mandatory)]
[Alias('GetUserKeyBinding')]
[switch]
$GetUserKeyBindings
)


PowerCode -GetUserDirectory |
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