Extensions/Tasks/GetWorkspaceTasks.PowerCode.ps1
------------------------------------------------




### Synopsis
Gets VSCode workspace tasks



---


### Description

Gets the workspace tasks from Visual Studio Code



---


### Examples
> EXAMPLE 1

```PowerShell
Get-PowerCode -GetWorkspaceTask
```
> EXAMPLE 2

```PowerShell
PowerCode -GetWorkspaceTasks
```


---


### Parameters
#### **GetWorkspaceTask**

If set, will get the current workspace's tasks.






|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|true    |named   |false        |GetWorkspaceTasks|





---


### Syntax
```PowerShell
Extensions/Tasks/GetWorkspaceTasks.PowerCode.ps1 -GetWorkspaceTask [<CommonParameters>]
```
