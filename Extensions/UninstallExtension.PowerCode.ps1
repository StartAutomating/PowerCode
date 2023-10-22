<#
.SYNOPSIS
    Uninstalls VSCode Extensions
.DESCRIPTION
    Uninstalls extensions for Visual Studio Code
#>
[ValidatePattern('^Uninstall-(?>Power|VS)Code')]
param(
# The Extension ID
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[string]
$ExtensionID
)

$codeArgs = @(
    '--uninstall-extension'
    $ExtensionID
)

code @codeArgs
