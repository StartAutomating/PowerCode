Extensions/GetExtensionConfiguration.PowerCode.ps1
--------------------------------------------------




### Synopsis
Gets the VS Code Configuration



---


### Description

Gets the Visual Studio Code configuration



---


### Examples
> EXAMPLE 1

```PowerShell
Get-PowerCode -ExtensionConfigurations
```
> EXAMPLE 2

```PowerShell
Get-VSCode -ExtensionConfiguration
```


---


### Parameters
#### **ExtensionConfiguration**

If set, will get the configuration options for each extension.






|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[Switch]`|true    |named   |false        |ExtensionConfigurations|





---


### Syntax
```PowerShell
Extensions/GetExtensionConfiguration.PowerCode.ps1 -ExtensionConfiguration [<CommonParameters>]
```
