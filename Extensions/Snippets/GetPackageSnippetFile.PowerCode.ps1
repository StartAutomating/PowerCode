<#
.SYNOPSIS
    Gets the list of snippets
.DESCRIPTION
    Gets the list of snippets in all packages Visual Studio Code.
.EXAMPLE
    Get-PowerCode -PackageSnippet
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get a list of all package files.
[Parameter(Mandatory)]
[Alias('PackageSnippetFiles')]
[switch]
$PackageSnippetFile
)

Get-PowerCode -PackageFileList | 
    Split-Path |
    Get-ChildItem -Recurse -Filter *.code-snippets