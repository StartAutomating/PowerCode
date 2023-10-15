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
        if ($attr -isnot [Management.Automation.CmdletAttribute]) { continue }

        $extendedCommandNames = @(                    
            (
                ($attr.VerbName -replace '\s') + '-?' + ($attr.NounName -replace '\s')
            ) -replace '^\-' -replace '\-$'
        )

        if ($extendedCommandNames) {

            foreach ($commandPattern in $extendedCommandNames) {
                if ($InvocationName -match $commandPattern) {
                    $extension
                    continue
                }
            }

            continue nextExtension

        }

    }
    $extension
})