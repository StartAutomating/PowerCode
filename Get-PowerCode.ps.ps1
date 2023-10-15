function Get-PowerCode
{
    <#
    .SYNOPSIS
        Gets PowerCode.
    .DESCRIPTION        
        Gets PowerCode and it's extended commands.

        Because 'Get' is the default verb in PowerShell,
        Get-PowerCode also allows you to run other commands in noun-oriented syntax.
    .EXAMPLE
        # Get every specialized PowerCode command
        Get-PowerCode

    #>
    [CmdletBinding(PositionalBinding=$false)]
    [Alias(
        'Get-VSCode'
    )]
    param(
    # Any positional arguments that are not directly bound.
    # This parameter primarily exists to allow Get-PowerCode to pass it down to other commands.
    [Parameter(ValueFromRemainingArguments)]
    [Alias('Args')]
    $Argument,

    # The InputObject.
    # This parameter primarily exists to allow Get-PowerCode to pass it down to other commands.
    [Parameter(ValueFromPipeline)]
    [Alias('Input','In')]    
    $InputObject    
    )

    dynamicParam {             
        $myModule = $PowerCode
        $myInv    = $MyInvocation
        
        # Fun PowerShell fact:  'Get' is the default verb.
                
        $dynamicParameterSettings = [Ordered]@{
            ParameterSetName = '__AllParameterSets'
            NoMandatory = $true
            PositionOffset = 1kb
        }

        if ($myInv.InvocationName) {
            $PowerCode.GetDynamicParameters($myInv.InvocationName)
        } else {
            $callstackPeek = @(Get-PSCallStack)[-1]
            $callerCommand = $callstackPeek.InvocationInfo.MyCommand.ToString()
            $CallerName =
                if ($callerCommand -match "-Name\s{0,1}(?<Name>\S+)") {
                    $matches.Name
                } elseif ($callerCommand -match '(?>gcm|Get-Command)\s{0,1}(?<Name>\S+)') {
                    $matches.Name
                }            
            $PowerCode.GetDynamicParameters($CallerName)
        }
    }

    begin {        
        $myInv = $MyInvocation
        $matchingExtensions    = $PowerCode.ExtensionsOf($myInv.InvocationName)
        $steppablePipelines = @()
        $parameterCopy = [Ordered]@{} + $PSBoundParameters

        foreach ($matchingExtension in $matchingExtensions) {
                $myArgs = @()
                $mySplat = [Ordered]@{}
                :nextParameter foreach ($extendedParameter in $matchingExtension.Parameters.Values) {
                    if ($parameterCopy.Contains($extendedParameter.Name)) {
                        $mySplat[$extendedParameter.Name] = $parameterCopy[$extendedParameter.Name]
                        continue
                    }
                    foreach ($extendedParameterAlias in $extendedParameter.Aliases) {
                        if ($parameterCopy.Contains($extendedParameterAlias)) {
                            $mySplat[$extendedParameterAlias] = $parameterCopy[$extendedParameterAlias]
                            continue nextParameter
                        }                        
                    }
                }
                continue if (-not $mySplat.Count)
                # create a steppable pipeline command,
                $steppablePipelineCmd = {& $matchingExtension @mySplat @myArgs}
                # get a steppable pipeline,
                $steppablePipeline = $steppablePipelineCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
                # and start the steppable pipeline.
                $steppablePipeline.Begin($PSCmdlet)
                $steppablePipelines += $steppablePipeline                         
        }                
    }
    process {
        $myInv = $MyInvocation
        if ($steppablePipelines) {
            foreach ($steppablePipeline in $steppablePipelines) {
                $steppablePipeline.Process($_)
            }            
            return
        }
        else {
            $PowerCode
        }        
    }

    end {
        foreach ($steppablePipeline in $steppablePipelines) {
            if ($steppablePipeline) {
                $steppablePipeline.End()
            }
        }        
    }
}
