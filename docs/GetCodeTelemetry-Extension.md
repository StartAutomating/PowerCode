Extensions/GetCodeTelemetry.PowerCode.ps1
-----------------------------------------




### Synopsis
Gets VSCode Telemetry



---


### Description

Gets information about the telemetry events collected by Visual Studio Code.



---


### Examples
> EXAMPLE 1

```PowerShell
PowerCode -CodeTelemetry
```
> EXAMPLE 2

```PowerShell
Get-VSCode -CodeTelemetry
```


---


### Parameters
#### **CodeTelemetry**

If set, will list telemetry events visual studio code collects.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |





---


### Syntax
```PowerShell
Extensions/GetCodeTelemetry.PowerCode.ps1 -CodeTelemetry [<CommonParameters>]
```
