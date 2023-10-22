<#
.SYNOPSIS
    Gets the Product Information
.DESCRIPTION
    Gets the Visual Studio Code Product Information stored in product.json
.EXAMPLE
    Get-VSCode -ProductInfo
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the version of VSCode.
[Parameter(Mandatory)]
[switch]
$ProductInfo
)


Get-Command -CommandType Application -Name code |
    Select-Object -ExpandProperty Source | 
    Split-Path |
    Split-Path |
    Get-ChildItem -Recurse -Filter product.json |
    Select-Object -First 1 |    
    Get-Content -Raw -LiteralPath { $_.FullName } |
    ConvertFrom-Json


