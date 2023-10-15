#require -Module HelpOut
Push-Location ($PSScriptRoot | Split-Path)

Import-Module .\PowerCode.psd1

Save-MarkdownHelp -Module PowerCode -ScriptPath Extensions -ReplaceScriptName '\.(PowerCode)\.ps1$' -ReplaceScriptNameWith "-Extension" -PassThru

Pop-Location