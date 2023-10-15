<#
.SYNOPSIS
    Sets the VS Code Font Size
.DESCRIPTION
    Sets the Visual Studio Code Font Size
.EXAMPLE
    Set-PowerCode -SetFontSize 24
.EXAMPLE
    Set-PowerCode -SetFontSize 48 -SetFontIn screencast
.EXAMPLE
    Update-PowerCode -UpdateFontSize 16 -SetFontIn markdown
#>
[Management.Automation.Cmdlet("(?>Update|Set)","(?>Power|VSCode)")]
param(
# If set, will change the font size
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[Alias('UpdateFontSize')]
[double]
$SetFontSize,

# Where the font size change should take place.
[ValidateSet('editor','terminal','screencast','markdown')]
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('UpdateFontIn')]
[string[]]
$SetFontIn = @('editor','terminal')
)

$lookupSetIn = @{
    "terminal" = "terminal.integrated"
    "screencast" = "screencastMode"
    "markdown" = "markdown.preview"
}

foreach ($setIn in $SetFontIn) {
    $lookedUpSet =  if ($lookupSetIn[$setIn]) {
        $lookupSetIn[$setIn]
    } else { $setIn.ToLower() }    
    Set-VSCode -SettingPath $targetPath -Change @{"$($lookedUpSet).fontSize" = $SetFontSize}
}

