<#
.SYNOPSIS
    Gets VSCode user settings
.DESCRIPTION
    Gets the user settings from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetUserSettings
.EXAMPLE
    PowerCode -GetUserSetting
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current user's settings.
[Parameter(Mandatory)]
[Alias('GetUserSetting')]
[switch]
$GetUserSettings
)


PowerCode -GetUserDirectory |
    Get-ChildItem -Filter settings.json |
    & { process {
        [IO.File]::ReadAllText($_.Fullname) | ConvertFrom-Json
    } }