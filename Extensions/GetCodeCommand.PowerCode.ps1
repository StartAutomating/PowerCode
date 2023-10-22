<#
.SYNOPSIS
    Gets the VS Code Commands
.DESCRIPTION
    Gets the Visual Studio Code command list
.EXAMPLE
    Get-PowerCode -CommandList    
.EXAMPLE
    Get-VSCode -CommandList
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the version of VSCode.
[Parameter(Mandatory)]
[Alias('CommandsList','ListCommand','ListCommands')]
[switch]
$CommandList
)

@(
    PowerCode -PackageFileList
    PowerCode -ExtensionPackageFileList
) |
    ForEach-Object {
        $file = $_
        $fileText = Get-Content -Raw -LiteralPath $file.Fullname
        if ($fileText -match 'commands') {
            $fileData =  $fileText | 
                ConvertFrom-Json

            if ($fileData.contributes.commands) {
                $fileData.contributes.commands
            }            
        }        
    }