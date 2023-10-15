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
Set-PowerCode -SetFontSize 24
```
> EXAMPLE 2

```PowerShell
Set-PowerCode -SetFontSize 48 -SetFontIn screencast
```
> EXAMPLE 3

```PowerShell
Update-PowerCode -UpdateFontSize 16 -SetFontIn markdown
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
* screencast
* markdown






|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|UpdateFontIn|





---


### Syntax
```PowerShell
Extensions/SetFontSize.PowerCode.ps1 [-SetFontSize] <Double> [[-SetFontIn] <String[]>] [<CommonParameters>]
```
