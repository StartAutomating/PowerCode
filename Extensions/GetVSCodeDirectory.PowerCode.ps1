<#
.SYNOPSIS
    Gets the nearest VSCode directory
.DESCRIPTION
    Gets the nearest VSCode directory
.EXAMPLE
    Get-PowerCode -GetUserTasks
.EXAMPLE
    PowerCode -GetUserTask
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the nearest VS Code Directory.
[Parameter(Mandatory)]
[switch]
$GetVSCodeDirectory
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