<#
.SYNOPSIS
    Gets the list of snippets files
.DESCRIPTION
    Gets the list of snippets files in all packages Visual Studio Code.
.EXAMPLE
    Get-PowerCode -CodeSnippet
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get a list of all code snippet files.
[Parameter(Mandatory)]
[Alias('CodeSnippets')]
[switch]
$CodeSnippet
)

Get-PowerCode -PackageSnippetFile |
    ForEach-Object -Begin {
        $allSnippets = [Ordered]@{
            PSTypeName='VSCode.Snippets'
        }
    } {
        $allSnippets[$_.Directory.Parent.Name] =
            Get-Content -Raw $_.FullName | ConvertFrom-Json
    } {
        [PSCustomObject]$allSnippets
    }