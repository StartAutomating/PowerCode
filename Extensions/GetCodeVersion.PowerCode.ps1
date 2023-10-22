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
[ValidatePattern(
    '^
    (?:Get)?         
    (?>Power|VS)Code
    ', 
    Options='IgnoreCase,IgnorePatternWhitespace'
)]
param(
# If set, will get the version of VSCode.
[Parameter(Mandatory)]
[Alias('VSCodeVersion')]
[switch]
$CodeVersion
)

(code -v | Select-Object -First 1) -as [Version]
