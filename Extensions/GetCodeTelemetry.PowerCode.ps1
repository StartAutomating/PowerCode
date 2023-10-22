<#
.SYNOPSIS
    Gets VSCode Telemetry
.DESCRIPTION
    Gets information about the telemetry events collected by Visual Studio Code.
.EXAMPLE
    PowerCode -CodeTelemetry
.EXAMPLE
    Get-VSCode -CodeTelemetry
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will list telemetry events visual studio code collects.
[Parameter(Mandatory)]
[switch]
$CodeTelemetry
)

code --telemetry | ConvertFrom-Json