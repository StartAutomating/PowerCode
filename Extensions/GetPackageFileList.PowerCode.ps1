<#
.SYNOPSIS
    Gets the list of package files
.DESCRIPTION
    Gets the list of package files that power Visual Studio Code.
.EXAMPLE
    Get-PowerCode -PackageFileList
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get a list of all package files.
[Parameter(Mandatory)]
[switch]
$PackageFileList
)

Get-Command -CommandType Application -Name code |
    Select-Object -ExpandProperty Source | 
    Split-Path |
    Split-Path |
    Get-ChildItem -Recurse -Filter package.json
