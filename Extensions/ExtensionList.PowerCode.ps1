<#
.SYNOPSIS
    Gets VSCode Extensions
.DESCRIPTION
    Gets the list of Visual Studio Code Extensions
.EXAMPLE
    Get-VSCode -ExtensionList
.EXAMPLE
    Get-PowerCode -ExtensionList
.EXAMPLE
    PowerCode -ExtensionList
.EXAMPLE
    PowerCode -ListExtension
.EXAMPLE
    PowerCode -ListExtensions
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the extensions for VSCode.
[Parameter(Mandatory)]
[Alias('ListExtension','ListExtensions')]
[switch]
$ExtensionList
)

process {
    code --list-extensions --show-versions | 
        ForEach-Object {
            $extensionName, $extensionVersion = $_ -split '@'
            [PSCustomObject][Ordered]@{
                PSTypeName = 'VSCode.Extension'
                ExtensionName = $extensionName
                ExtensionVersion = [Version]$extensionVersion
            }
        }
}