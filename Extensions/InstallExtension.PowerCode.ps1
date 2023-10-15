<#
.SYNOPSIS
    Installs VSCode Extensions
.DESCRIPTION
    Installs Extensions for Visual Studio Code Extensions
#>
[Management.Automation.Cmdlet("Install","(?>Power|VS)Code")]
param(
# The Extension Identifier
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[string]
$ExtensionID,

# The Extension Publisher
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$Publisher,

# The Extension Version
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$ExtensionVersion,

# If set, will allow pre-release extensions
[Parameter(ValueFromPipelineByPropertyName)]
[switch]
$PreRelease
)

$codeArgs = @(
    '--install-extension'
    if ($ExtensionID -like '*.*@*') {
        $Publisher, $ExtensionID = $ExtensionID -split '\.',2
        $ExtensionID, $ExtensionVersion = $ExtensionID -split '@',2
    } elseif ($ExtensionID -like '*.*') {
        $Publisher, $ExtensionID = $ExtensionID -split '\.',2
    } elseif (-not $Publisher) {
        Write-Error "Must provide a -Publisher or a complete extensionID"
        return
    }

    if ($PreRelease) {
        "--pre-release"
    }

    if ($ExtensionVersion) {
        "$publisher.$ExtensionID@$extensionVersion"
    } else {
        "$publisher.$ExtensionID"
    }
)

code @codeArgs
