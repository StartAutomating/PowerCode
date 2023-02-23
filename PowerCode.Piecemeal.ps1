#require -Module Piecemeal

# Push to this directory
Push-Location $PSScriptRoot 
# Get-PowerCode is generated with Piecemeal
Install-Piecemeal -ExtensionNoun 'PowerCode' -ExtensionPattern '\.powercode\.ps1$' -ExtensionTypeName 'PipeScript.Transpiler' -OutputPath '.\Get-PowerCode.ps1' |
    Add-Member Noteproperty CommitMessage "Get-PowerCode: Updating Piecemeal Version" -Force -PassThru


# Pop back to wherever we were
Pop-Location
