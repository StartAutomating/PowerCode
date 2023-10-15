Extensions/SetFontFamily.PowerCode.ps1
--------------------------------------




### Synopsis
Sets the VS Code Font Family



---


### Description

Sets the Visual Studio Code Font Family



---


### Examples
> EXAMPLE 1

```PowerShell
Set-PowerCode -SetFontFamily "Consolas"
```
> EXAMPLE 2

```PowerShell
Set-PowerCode -SetFontFamily "Consolas" -SetFontIn terminal
```
> EXAMPLE 3

```PowerShell
Update-PowerCode -UpdateFontFamily 16 -SetFontFamily "Arial"
```


---


### Parameters
#### **SetFontFamily**

If set, will change the font size






|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|UpdateFontFamily|



#### **SetFontFamilyIn**

Where the font size change should take place.



Valid Values:

* editor
* terminal
* screencast
* markdown






|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|UpdateFontFamilyIn|





---


### Syntax
```PowerShell
Extensions/SetFontFamily.PowerCode.ps1 [-SetFontFamily] <String> [[-SetFontFamilyIn] <String[]>] [<CommonParameters>]
```
