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
[ValidatePattern('^(?>Update|Set)-(?>Power|VS)Code')]
param(
# If set, will change the font size
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[Alias('UpdateFontSize')]
[double]
$SetFontSize,

# Where the font size change should take place.
[ValidateSet('editor','terminal','screencast','markdown')]
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('UpdateFontSizeIn')]
[string[]]
$SetFontSizeIn = @('editor','terminal')
)

$lookupSetIn = @{
    "terminal" = "terminal.integrated"
    "screencast" = "screencastMode"
    "markdown" = "markdown.preview"
}

foreach ($setIn in $SetFontIn) {
    $lookedUpSet =  if ($lookupSetIn[$setIn]) {
        $lookupSetIn[$setIn]
    } else { $setIn }    
    Set-VSCode -Change @{
        "$($lookedUpSet).fontSize" = $SetFontSize
    }
}

