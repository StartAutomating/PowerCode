Get-VSCode
----------




### Synopsis
Gets VSCode settings.



---


### Description

Gets Visual Studio Code settings.



---


### Related Links
* [https://code.visualstudio.com/docs/getstarted/settings](https://code.visualstudio.com/docs/getstarted/settings)





---


### Examples
#### EXAMPLE 1
```PowerShell
Get-VSCode
```



---


### Parameters
#### **SettingPath**

The Path to Visual Studio Code Settings.
If not provided, settings will be automatically found.






|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|SettingsPath<br/>Fullname|





---


### Notes
Visual Studio code can have settings stored in a settings.json file 
that exists within the workspace or at a global location.

We want to be able to able get the data from files at both places, if they exist, regardless of OS.



---


### Syntax
```PowerShell
Get-VSCode [[-SettingPath] <Object>] [<CommonParameters>]
```
