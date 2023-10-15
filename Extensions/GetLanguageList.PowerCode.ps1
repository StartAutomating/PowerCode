<#
.SYNOPSIS
    Gets the VS Code Language List
.DESCRIPTION
    Gets the Visual Studio Code Language List
.EXAMPLE
    Get-VSCode -LanguageList
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the details of commands.
[Parameter(Mandatory)]
[Alias('ListLanguage','ListLanguages')]
[switch]
$LanguageList
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

            if ($fileData.contributes.languages) {
                $fileData.contributes.languages
            }            
        }        
    }

