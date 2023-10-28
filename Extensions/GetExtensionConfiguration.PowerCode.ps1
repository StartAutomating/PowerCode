<#
.SYNOPSIS
    Gets the VS Code Configuration
.DESCRIPTION
    Gets the Visual Studio Code configuration
.EXAMPLE
    Get-PowerCode -ExtensionConfigurations
.EXAMPLE
    Get-VSCode -ExtensionConfiguration
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the configuration options for each extension.
[Parameter(Mandatory)]
[Alias('ExtensionConfigurations')]
[switch]
$ExtensionConfiguration
)

@(
    PowerCode -PackageFileList
    PowerCode -ExtensionPackageFileList
) |
    ForEach-Object {
        $file = $_
        $fileText = Get-Content -Raw -LiteralPath $file.Fullname
        
        $fileData =  $fileText | 
            ConvertFrom-Json

        if ($fileData.contributes.configuration) {
            foreach ($config in $fileData.contributes.configuration){
                $config.pstypenames.insert(0, 'VSCode.Configuration.Setting')
                $config
            }
        }            
    
    }