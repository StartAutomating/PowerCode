<#
.SYNOPSIS
    Gets Extensions Of a particular Command
.DESCRIPTION
    Gets the commands that extensions a particular command.
#>
param(
[string]
$InvocationName
)

@(:nextExtension foreach ($extension in $this.Extension) {
    foreach ($attr in $extension.ScriptBlock.Attributes) {
        if ($attr -isnot [ValidatePattern]) { continue }        
        if (
            [regex]::new(
                $attr.RegexPattern,
                $attr.Options,
                [Timespan]'00:00:00.1'
            ).IsMatch($InvocationName)
        ) {
            $extension
            continue nextExtension
        }
    }    
})