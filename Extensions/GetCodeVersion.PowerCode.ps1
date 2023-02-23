<#
.SYNOPSIS
    Gets the VS Code Version
.DESCRIPTION
    Gets the Visual Studio Code Version
.EXAMPLE
    Get-VSCode -Version
#>
[Management.Automation.Cmdlet("Get","VSCode")]
param(
# If set, will get the version of VSCode.
[Parameter(Mandatory)]
[switch]
$Version
)

(code -v | Select-Object -First 1) -as [Version]
