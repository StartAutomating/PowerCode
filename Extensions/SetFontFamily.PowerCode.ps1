<#
.SYNOPSIS
    Sets the VS Code Font Family
.DESCRIPTION
    Sets the Visual Studio Code Font Family
.EXAMPLE
    Set-PowerCode -SetFontFamily "Consolas"
.EXAMPLE
    Set-PowerCode -SetFontFamily "Consolas" -SetFontIn terminal
.EXAMPLE
    Update-PowerCode -UpdateFontFamily 16 -SetFontFamily "Arial"
#>
[Management.Automation.Cmdlet("(?>Update|Set)","(?>Power|VSCode)")]
param(
# If set, will change the font size
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[Alias('UpdateFontFamily')]
[string]
$SetFontFamily,

# Where the font size change should take place.
[ValidateSet('editor','terminal','screencast','markdown')]
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('UpdateFontFamilyIn')]
[string[]]
$SetFontFamilyIn = @('editor','terminal')
)

$lookupSetIn = @{
    "terminal" = "terminal.integrated"
    "screencast" = "screencastMode"
    "markdown" = "markdown.preview"
}

foreach ($setIn in $SetFontFamilyIn) {
    $lookedUpSet =  if ($lookupSetIn[$setIn]) {
        $lookupSetIn[$setIn]
    } else { $setIn.ToLower() }    
    Set-VSCode -Change @{
        "$($lookedUpSet).fontFamily" = $SetFontFamily
    }
}

