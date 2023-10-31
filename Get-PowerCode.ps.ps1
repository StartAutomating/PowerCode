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
        'Get-VSCode',                
        'Install-PowerCode','Install-VSCode',
        'Remove-VSCode','Remove-PowerCode',
        'Set-PowerCode','Set-VSCode',        
        'Uninstall-PowerCode','Uninstall-VSCode',
        'Update-PowerCode','Update-VSCode'
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
        # We want to get dynamic parameters from anywhere in the module, so define `$MyModule
        $myModule = $MyInvocation.MyCommand.ScriptBlock.Module
        
        # And we'll need to know our invocation name, so define that as well.
        $myInv    = $MyInvocation
        
        $dynamicParameterSettings = [Ordered]@{
            ParameterSetName = '__AllParameterSets'
            NoMandatory = $true
            PositionOffset = 1kb
        }

        # If we have an invocation name
        if ($myInv.InvocationName) {
            # get the dynamic parameters from that
            $myModule.GetDynamicParameters($myInv.InvocationName)
        } else {
            # Otherwise, peek at the callstack
            $callstackPeek = @(Get-PSCallStack)[-1]
            # and get the caller command
            $callerCommand = $callstackPeek.InvocationInfo.MyCommand.ToString()
            $CallerName =
                # If there was an explicit -Name parameter,
                if ($callerCommand -match "-Name\s{0,1}(?<Name>\S+)")
                {
                    $matches.Name # use that as the caller name
                }
                # Otherwise, if Get-Command was called positionally,
                elseif ($callerCommand -match '(?>gcm|Get-Command)\s{0,1}(?<Name>\S+)')
                {                    
                    $matches.Name # use that as the caller name
                }
            # Get the dynamic parameters for this potential caller
            $myModule.GetDynamicParameters($CallerName)
        }
    }

    begin {
        $myInv                 = $MyInvocation
        $myModule              = $MyInvocation.MyCommand.ScriptBlock.Module
        $matchingExtensions    = $myModule.ExtensionsOf($myInv.InvocationName)
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
