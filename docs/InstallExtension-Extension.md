Extensions/InstallExtension.PowerCode.ps1
-----------------------------------------




### Synopsis
Installs VSCode Extensions



---


### Description

Installs Extensions for Visual Studio Code Extensions



---


### Parameters
#### **ExtensionID**

The Extension Identifier






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



#### **Publisher**

The Extension Publisher






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **ExtensionVersion**

The Extension Version






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



#### **PreRelease**

If set, will allow pre-release extensions






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|





---


### Syntax
```PowerShell
Extensions/InstallExtension.PowerCode.ps1 [-ExtensionID] <String> [[-Publisher] <String>] [[-ExtensionVersion] <String>] [-PreRelease] [<CommonParameters>]
```
