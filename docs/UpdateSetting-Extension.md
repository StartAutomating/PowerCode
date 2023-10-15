Extensions/UpdateSetting.PowerCode.ps1
--------------------------------------




### Synopsis
Updates VSCode Settings



---


### Description

Updates Visual Studio Code Settings



---


### Parameters
#### **SettingPath**

The Path to Visual Studio Code Settings.
If not provided, settings will be automatically found.






|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|SettingsPath<br/>Fullname|



#### **InUserSettings**

If set will make changes to the user settings.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



#### **InWorkspaceSettings**

If set will make changes to the workspace settings.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



#### **Change**

One or more changes to the settings.






|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|true    |2       |false        |Changes|





---


### Syntax
```PowerShell
Extensions/UpdateSetting.PowerCode.ps1 [[-SettingPath] <Object>] [-InUserSettings] [-InWorkspaceSettings] [-Change] <Object> [<CommonParameters>]
```
