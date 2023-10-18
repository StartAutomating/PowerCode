#requires -Module PSSVG

$powerShellChevron = Invoke-RestMethod -Uri https://pssvg.start-automating.com/Examples/PowerShellChevron.svg

$FontName = 'Tilt Neon'

Push-Location ($PSScriptRoot | Split-Path)

$assetsPath = Join-Path $pwd Assets
if (-not (Test-Path $assetsPath)) {
    $null = New-Item -ItemType Directory -Path $assetsPath -Force
}
svg -ViewBox 300, 100 @(
    SVG.defs @(
        SVG.GoogleFont -FontName $FontName
    )

    SVG.symbol -ViewBox 1,1 @(
        SVG.polygon -Points @(
            2/3
            1/2
    
            1/4
            3/4
    
            1/4
            1/4
        )                  
    ) -Id codeTriangle
    $powerShellChevron.svg.symbol
    SVG.use -Href '#codeTriangle' -StrokeWidth 0.01 -Stroke '#4488ff' -Fill transparent -Width 80% -Height 80% -Y 10% -X 0%
    # SVG.use -Href '#psChevron' -Fill '#4488ff' -Height 40% -Y 30% -X -10%
    SVG.use -Href '#psChevron' -Fill '#4488ff' -Height 20% -Y 40% -X -12.5%
    SVG.text -Content "PowerCode" -AlignmentBaseline 'central' -Y 49% -FontSize 1.8em -X 45% -TextAnchor 'start' -Fill '#4488ff' -Style "font-family:'$FontName'"
) -OutputPath (
    $assetsPath | 
        Join-Path -ChildPath PowerCode.svg
)

Pop-Location