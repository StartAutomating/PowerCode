Extensions/Workspaces/GetNearestVSCodeWorkspace.PowerCode.ps1
-------------------------------------------------------------




### Synopsis
Gets the nearest VSCode workspace



---


### Description

Gets the nearest VSCode mutli-root workspace file or object



---


### Examples
> EXAMPLE 1

```PowerShell
Get-PowerCode -NearestWorkspaceFile
```
> EXAMPLE 2

```PowerShell
PowerCode -NearestWorkspaceFiles
```
> EXAMPLE 3

```PowerShell
PowerCode -NearestWorkspaceObject
```


---


### Parameters
#### **NearestVSCodeWorkspaceFile**

If set, will get code-workspace files in the nearest directory containing them.






|Type      |Required|Position|PipelineInput|Aliases                                                                       |
|----------|--------|--------|-------------|------------------------------------------------------------------------------|
|`[Switch]`|true    |named   |false        |NearestWorkspaceFile<br/>NearestWorkspaceFiles<br/>NearestVSCodeWorkspaceFiles|



#### **NearestVSCodeWorkspaceObject**

If set, will get the nearest code workspace objects.






|Type      |Required|Position|PipelineInput|Aliases                                                                             |
|----------|--------|--------|-------------|------------------------------------------------------------------------------------|
|`[Switch]`|true    |named   |false        |NearestWorkspaceObject<br/>NearestWorkspaceObjects<br/>NearestVSCodeWorkspaceObjects|





---


### Syntax
```PowerShell
Extensions/Workspaces/GetNearestVSCodeWorkspace.PowerCode.ps1 -NearestVSCodeWorkspaceFile [<CommonParameters>]
```
```PowerShell
Extensions/Workspaces/GetNearestVSCodeWorkspace.PowerCode.ps1 -NearestVSCodeWorkspaceObject [<CommonParameters>]
```
