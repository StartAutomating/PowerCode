<#
.SYNOPSIS
    Gets the nearest VSCode directory
.DESCRIPTION
    Gets the nearest VSCode directory
.EXAMPLE
    Get-PowerCode -GetNearestVSCodeDirectory
.EXAMPLE
    PowerCode -GetNearestVSCodeDirectory
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the nearest VS Code Directory.
[Parameter(Mandatory)]
[switch]
$GetNearestVSCodeDirectory
)

$currentLocation = $pwd
$foundDirectory  = $null
do {
    $vsCodeDirectory = Join-Path $currentLocation ".vscode"
    if (Test-Path $vsCodeDirectory) {
        $foundDirectory = $vsCodeDirectory
        break
    }
    $currentLocation = $currentLocation | Split-Path
} while ($currentLocation)


if ($foundDirectory) {
    return (Get-Item -Path $foundDirectory)
}