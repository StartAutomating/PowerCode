Extensions/Tasks/GetProjectTaskInputs.PowerCode.ps1
---------------------------------------------------




### Synopsis
Gets VSCode project tasks



---


### Description

Gets the user tasks from Visual Studio Code



---


### Examples
> EXAMPLE 1

```PowerShell
Get-PowerCode -GetProjectTaskInputs
```
> EXAMPLE 2

```PowerShell
PowerCode -GetProjectTaskInput
```


---


### Parameters
#### **GetProjectTaskInput**

If set, will get the current project's task inputs.






|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[Switch]`|true    |named   |false        |GetProjectTaskInputs|





---


### Syntax
```PowerShell
Extensions/Tasks/GetProjectTaskInputs.PowerCode.ps1 -GetProjectTaskInput [<CommonParameters>]
```
