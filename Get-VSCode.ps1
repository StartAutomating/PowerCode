function Get-VSCode
{
    <#
    .SYNOPSIS
        Gets VSCode settings.
    .DESCRIPTION
        Gets Visual Studio Code settings.
    .EXAMPLE
        Get-VSCode
    .LINK
        https://code.visualstudio.com/docs/getstarted/settings
    .NOTES
        Visual Studio code can have settings stored in a settings.json file 
        that exists within the workspace or at a global location.

        We want to be able to able get the data from files at both places, if they exist, regardless of OS.
    #>
    param(
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('SettingsPath', 'Fullname')]
    $SettingPath
    )

    begin {
        if (-not $script:VSCodeUserSettingPath) {
            $script:VSCodeUserSettingPath = 
                if ($IsMacOS) 
                {
                    "$(Join-Path $home Library |
                        Join-Path -ChildPath 'Application\ Support' |
                        Join-Path -ChildPath Code |
                        Join-Path -ChildPath User |
                        Join-Path -ChildPath settings.json)"                    
                } 
                elseif ($IsLinux) 
                {
                    "$HOME/.config/Code/User/settings.json"
                } else {
                    "$env:APPDATA\Code\User\settings.json"
                }            
        }
    }

    process {
        # First, we need to find all potential settings.json paths
        $potentialPaths = @(
            # If we provided a -SettingPath
            if ($settingsPath) {
                # look for settings there.
            }
            else {
                # Otherwise, look for a workspace setting
                $workspacePath = Join-Path $pwd ".vscode" | 
                    Join-Path -ChildPath "settings.json"
                
                if (Test-Path $workspacePath) {
                    "$workspacePath"
                }
                
                # and look for global settings.
                $script:VSCodeUserSettingPath
            }
        )

        $CombinedSettings = [Ordered]@{
            PSTypeName = 'VSCode.Settings'
            SettingsPath = $potentialPaths
        }
        
        foreach ($settingsPath in $potentialPaths) {
            $settingsFromFile = 
                Get-Content -Raw -Path $settingsPath |
                    ConvertFrom-Json

            foreach ($property in $settingsFromFile.psobject.properties) {
                if (-not $CombinedSettings[$property.Name]) {
                    $CombinedSettings[$property.Name] = $property.Value
                }
            }
        }

        [PSCustomObject]$CombinedSettings
    }
}
