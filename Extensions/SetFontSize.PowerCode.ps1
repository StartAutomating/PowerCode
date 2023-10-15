<#
.SYNOPSIS
    Sets the VS Code Font Size
.DESCRIPTION
    Sets the Visual Studio Code Font Size
.EXAMPLE
    Get-VSCode -Version
#>
[Management.Automation.Cmdlet("(?>Update|Set)","(?>Power|VSCode)")]
param(
# If set, will change the font size
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[Alias('UpdateFontSize')]
[double]
$SetFontSize,

# Where the font size change should take place.
[ValidateSet('editor','terminal')]
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('UpdateFontIn')]
[string[]]
$SetFontIn = @('editor','terminal')
)

$lookupSetIn = @{
    "terminal" = "terminal.integrated"
}

foreach ($setIn in $SetFontIn) {
    $lookedUpSet =  if ($lookupSetIn[$setIn]) {
        $lookupSetIn[$setIn]
    } else { $setIn }    
    Set-VSCode -SettingPath $targetPath -Change @{"$($lookedUpSet.ToLower()).fontSize" = $SetFontSize}
}

