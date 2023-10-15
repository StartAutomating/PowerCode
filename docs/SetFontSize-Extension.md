Extensions/SetFontSize.PowerCode.ps1
------------------------------------




### Synopsis
Sets the VS Code Font Size



---


### Description

Sets the Visual Studio Code Font Size



---


### Examples
> EXAMPLE 1

```PowerShell
Get-VSCode -Version
```


---


### Parameters
#### **SetFontSize**

If set, will change the font size






|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[Double]`|true    |1       |true (ByPropertyName)|UpdateFontSize|



#### **SetFontIn**

Where the font size change should take place.



Valid Values:

* editor
* terminal






|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|UpdateFontIn|





---


### Syntax
```PowerShell
Extensions/SetFontSize.PowerCode.ps1 [-SetFontSize] <Double> [[-SetFontIn] <String[]>] [<CommonParameters>]
```
