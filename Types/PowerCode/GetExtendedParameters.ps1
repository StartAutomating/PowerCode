<#
.SYNOPSIS
    Gets extended parameters
.DESCRIPTION
    Gets the extended parameters for an invocation name.

    Parameters will be mapped to any valid extensions of this invocation name.
    
    If there are enough valid parameters to run a parameter set, a dictionary of parameters will be returned.
#>

param(
    # The invocation name
    [string]$InvocationName,
    # A collection of parameters
    [Collections.IDictionary]$params, 
    # The parameter set name.  If not provided, all valid parameter sets will be examined.
    [string]$ParameterSetName
)

# Get extensions for the invocationname 
foreach ($extensionCommand in $this.ExtensionsOf($InvocationName)) {
    :nextParameterSet foreach ($paramSet in $extensionCommand.ParameterSets) {
        if ($ParameterSetName -and $paramSet.Name -ne $ParameterSetName) { continue }
        $mappedParams = [Ordered]@{} # Create a collection of mapped parameters
        $mandatories  =  # Walk thru each parameter of this command
            @(foreach ($myParam in $paramSet.Parameters) {
                if ($params.Contains($myParam.Name)) { # If this was in Params,
                    $mappedParams[$myParam.Name] = $params[$myParam.Name] # then map it.
                } else {
                    foreach ($paramAlias in $myParam.Aliases) { # Otherwise, check the aliases
                        if ($params.Contains($paramAlias)) { # and map it if the parameters had the alias.
                            $mappedParams[$myParam.Name] = $params[$paramAlias]
                            break
                        }
                    }
                }
                if ($myParam.IsMandatory) { # If the parameter was mandatory,
                    $myParam.Name # keep track of it.
                }
            })
    
        # Check for parameter validity.
        foreach ($mappedParamName in @($mappedParams.Keys)) {
            if (-not $this.IsParameterValid($exensionCommand, $mappedParamName, $mappedParams[$mappedParamName])) {
                $mappedParams.Remove($mappedParamName)
            }
        }
        
        foreach ($mandatoryParam in $mandatories) { # Walk thru each mandatory parameter.
            if (-not $mappedParams.Contains($mandatoryParam)) { # If it wasn't in the parameters.
                continue nextParameterSet
            }
        }
        $mappedParams.psobject.properties.Add([psnoteproperty]::new('Command',$extensionCommand))
        $mappedParams
    }    
}


