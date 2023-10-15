<#
.SYNOPSIS
    Gets the VSCode extension directory
.DESCRIPTION
    Gets the VSCode user extension directory
.EXAMPLE
    Get-PowerCode -ExtensionDirectory
.EXAMPLE
    PowerCode -ExtensionDirectory
.EXAMPLE
    Get-VSCode -ExtensionDirectory
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the extension directory.
[Parameter(Mandatory)]
[switch]
$ExtensionDirectory
)


if (-not $script:VSCodeExtensionDirectory) {
    $script:VSCodeExtensionDirectory = 
        if ($IsMacOS) 
        {
            "$HOME/.vscode/extensions"
        } 
        elseif ($IsLinux) 
        {
            "$HOME/.vscode/extensions"
        } else {            
            "$env:USERPROFILE\.vscode\extensions"
        }                
}

if (Test-path $script:VSCodeExtensionDirectory) {
    Get-Item -Path $script:VSCodeExtensionDirectory
}
