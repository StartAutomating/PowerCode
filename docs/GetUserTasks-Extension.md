Extensions/Tasks/GetUserTasks.PowerCode.ps1
-------------------------------------------




### Synopsis
Gets VSCode user tasks



---


### Description

Gets the user tasks from Visual Studio Code



---


### Examples
> EXAMPLE 1

```PowerShell
Get-PowerCode -GetUserTasks
```
> EXAMPLE 2

```PowerShell
PowerCode -GetUserTask
```


---


### Parameters
#### **GetUserTask**

If set, will get the current user's tasks.






|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|true    |named   |false        |GetUserTasks|





---


### Syntax
```PowerShell
Extensions/Tasks/GetUserTasks.PowerCode.ps1 -GetUserTask [<CommonParameters>]
```
