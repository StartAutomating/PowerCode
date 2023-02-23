Set-VSCode
----------




### Synopsis
Sets VSCode settings.



---


### Description

Sets Visual Studio Code settings.



---


### Related Links
* [https://code.visualstudio.com/docs/getstarted/settings](https://code.visualstudio.com/docs/getstarted/settings)





---


### Examples
#### EXAMPLE 1
```PowerShell
Set-VSCode
```



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
|`[Object]`|false   |2       |false        |Changes|



#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.


If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.



---


### Notes
Visual Studio code can have settings stored in a settings.json file 
that exists within the workspace or at a global location.

We want to be able to able get the data from files at both places, if they exist, regardless of OS.



---


### Syntax
```PowerShell
Set-VSCode [[-SettingPath] <Object>] [-InUserSettings] [-InWorkspaceSettings] [[-Change] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
