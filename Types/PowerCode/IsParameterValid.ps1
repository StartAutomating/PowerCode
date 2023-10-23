<#
.SYNOPSIS
    Determines if a parameter is valid
.DESCRIPTION
    Determines if a command's parameter value is valid.
#>
param(
    # The command
    [Parameter(Mandatory)]
    [Management.Automation.CommandInfo]    
    $Command,
    # Th parameter name
    [Parameter(Mandatory)]
    $ParameterName,
    
    # The value
    [PSObject]
    $Value
)

if ($Command.Parameters.Count -ge 0 -and 
    $Command.Parameters[$parameterName].Attributes
) {
    foreach ($attr in $Command.Parameters[$parameterName].Attributes) {
        $_ = $value
        if ($attr -is [Management.Automation.ValidateScriptAttribute]) {
            $result = try { . $attr.ScriptBlock } catch { $null }
            if ($result -ne $true) {
                return $false
            }
        }
        elseif ($attr -is [Management.Automation.ValidatePatternAttribute] -and 
                (-not [Regex]::new($attr.RegexPattern, $attr.Options, '00:00:05').IsMatch($value))
            ) {
                return $false
            }
        elseif ($attr -is [Management.Automation.ValidateSetAttribute] -and 
                $attr.ValidValues -notcontains $value) {
                    return $false
                }
        elseif ($attr -is [Management.Automation.ValidateRangeAttribute] -and (
            ($value -gt $attr.MaxRange) -or ($value -lt $attr.MinRange)
        )) {
            return $false
        }
    }
}
return $true