<#
.SYNOPSIS
    Updates VSCode Settings 
.DESCRIPTION
    Updates Visual Studio Code Settings
#>
[Management.Automation.Cmdlet("Set",'(?>Power|VS)Code')]
param(
# The Path to Visual Studio Code Settings.
# If not provided, settings will be automatically found.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('SettingsPath', 'Fullname')]
$SettingPath,

# If set will make changes to the user settings.
[switch]
$InUserSettings,

# If set will make changes to the workspace settings.
[switch]
$InWorkspaceSettings,

# One or more changes to the settings.
[Parameter(Mandatory)]
[Alias('Changes')]
$Change
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

    $targetPath = 
        if ($SettingPath) {
            $SettingPath
        } elseif ($InUserSettings) {
            $script:VSCodeUserSettingPath
        } elseif ($InWorkspaceSettings) {
            $workspacePath = Join-Path $pwd ".vscode" | 
                Join-Path -ChildPath "settings.json"
            "$workspacePath"
        } else {
            $potentialPaths[0]
        }

    if (-not $targetPath) {
        Write-Error "No idea where to hold settings."
        return
    }

    $targetSettingsObject = Get-Content -Path $targetPath -Raw | ConvertFrom-Json

    $allChanges = [Ordered]@{
        PSTypeName = 'PowerCode.Changes'
    }

    # If the change was a dictionary, make it an object
    if ($change -is [Collections.IDictionary]) {
        $change = [PSCustomObject]$change
    }

    foreach ($settingChange in $Change) {
        if ($settingChange -is [Collections.IDictionary]) {
            $settingChange = [PSCustomObject]$settingChange
        }
        foreach ($propertyToSet in $settingChange.psobject.properties) {
            $allChanges[$propertyToSet.Name] = $propertyToSet.Value
            $targetSettingsObject |
                Add-Member NoteProperty $propertyToSet.Name $propertyToSet.Value -Force
        }            
    }

    if ($WhatIfPreference) {
        [PSCustomObject][Ordered]@{
            PSTypeName = 'PowerCode.Pending.Change'
            SettingPath = $targetPath
            Change = [PSCustomObject]$allChanges
        }
        return
    }

    if ($PSCmdlet.ShouldProcess("Update $targetPath")) {
        $targetSettingsObject | 
            ConvertTo-Json -Depth 100 |
            Set-Content -Path $targetPath

        $allChanges["SettingPath"] = $targetPath
        [PSCustomObject]$allChanges
    }
}