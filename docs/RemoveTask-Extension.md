Extensions/Tasks/RemoveTask.PowerCode.ps1
-----------------------------------------




### Synopsis
Removes tasks from VSCode



---


### Description

Removes Visual Studio Code Tasks



---


### Parameters
#### **RemoveTaskName**

The name of the task to remove.






|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|true    |1       |false        |RemoveTaskLabel|



#### **RemoveTaskFrom**

The location the task should be removed from



Valid Values:

* Project
* User
* Workspace






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |





---


### Syntax
```PowerShell
Extensions/Tasks/RemoveTask.PowerCode.ps1 [-RemoveTaskName] <String> [[-RemoveTaskFrom] <String[]>] [<CommonParameters>]
```
