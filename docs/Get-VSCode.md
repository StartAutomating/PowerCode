Get-PowerCode
-------------




### Synopsis
Gets PowerCode.



---


### Description

Gets PowerCode and it's extended commands.
Because 'Get' is the default verb in PowerShell,
Get-PowerCode also allows you to run other commands in noun-oriented syntax.



---


### Examples
Get every specialized PowerCode command

```PowerShell
Get-PowerCode
```


---


### Parameters
#### **Argument**

Any positional arguments that are not directly bound.
This parameter primarily exists to allow Get-PowerCode to pass it down to other commands.






|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |false        |Args   |



#### **InputObject**

The InputObject.
This parameter primarily exists to allow Get-PowerCode to pass it down to other commands.






|Type      |Required|Position|PipelineInput |Aliases     |
|----------|--------|--------|--------------|------------|
|`[Object]`|false   |named   |true (ByValue)|Input<br/>In|





---


### Syntax
```PowerShell
Get-PowerCode [-Argument <Object>] [-InputObject <Object>] [<CommonParameters>]
```
