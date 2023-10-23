PowerCode.GetExtendedParameters()
---------------------------------




### Synopsis
Gets extended parameters



---


### Description

Gets the extended parameters for an invocation name.

Parameters will be mapped to any valid extensions of this invocation name.

If there are enough valid parameters to run a parameter set, a dictionary of parameters will be returned.



---


### Parameters
#### **InvocationName**

The invocation name






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



#### **params**

A collection of parameters






|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |



#### **ParameterSetName**

The parameter set name.  If not provided, all valid parameter sets will be examined.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |





---
