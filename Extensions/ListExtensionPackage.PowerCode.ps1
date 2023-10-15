<#
.SYNOPSIS
    Gets VS Extension Packages
.DESCRIPTION
    Gets VS Code Extension package files
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will list the extension package files.
[Parameter(Mandatory)]
[Alias('ListExtensionPackageFile','ListExtensionPackageFiles')]
[switch]
$ExtensionPackageFileList
)

PowerCode -ExtensionDirectory | 
    Get-ChildItem -Directory | 
    Get-ChildItem -Filter package.json