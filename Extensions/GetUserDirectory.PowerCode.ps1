<#
.SYNOPSIS
    Gets the VSCode user directory
.DESCRIPTION
    Gets the Visual Studio Code user directory.
.EXAMPLE
    Get-PowerCode -GetUserDirectory
.EXAMPLE
    PowerCode -GetUserDirectory
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the user directory.
[Parameter(Mandatory)]
[switch]
$GetUserDirectory
)

if (-not $script:VSCodeUserDirectory) {
    $script:VSCodeUserDirectory = 
        if ($IsMacOS) 
        {
            "$(Join-Path $home Library |
                Join-Path -ChildPath 'Application\ Support' |
                Join-Path -ChildPath Code |
                Join-Path -ChildPath User)"                    
        } 
        elseif ($IsLinux) 
        {
            "$HOME/.config/Code/User/"
        } else {
            "$env:APPDATA\Code\User\"
        }                
}

if (Test-path $script:VSCodeUserDirectory) {
    Get-Item -Path $script:VSCodeUserDirectory
}