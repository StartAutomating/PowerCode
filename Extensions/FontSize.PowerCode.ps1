<#
.SYNOPSIS
    Gets the VS Code Version
.DESCRIPTION
    Gets the Visual Studio Code Version
.EXAMPLE
    Get-VSCode -Version
#>
[Management.Automation.Cmdlet("Set","VSCode")]
param(
# If set, will change the font size
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[double]
$FontSize
)

Set-VSCode -SettingPath $targetPath -Change @{"editor.fontSize" = $FontSize}
