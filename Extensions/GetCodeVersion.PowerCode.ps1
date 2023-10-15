<#
.SYNOPSIS
    Gets the VS Code Version
.DESCRIPTION
    Gets the Visual Studio Code Version
.EXAMPLE
    Get-VSCode -CodeVersion
.EXAMPLE
    Get-PowerCode -VSCodeVersion
.EXAMPLE
    PowerCode -CodeVersion
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the version of VSCode.
[Parameter(Mandatory)]
[Alias('VSCodeVersion')]
[switch]
$CodeVersion
)

(code -v | Select-Object -First 1) -as [Version]
