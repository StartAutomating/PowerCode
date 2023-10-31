<#
.SYNOPSIS
    Gets VSCode workspace task inputs
.DESCRIPTION
    Gets the workspace tasks inputs from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetWorkspaceTaskInputs
.EXAMPLE
    PowerCode -GetWorkspaceTaskInput
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current workspace's tasks.
[Parameter(Mandatory)]
[Alias('GetWorkspaceTaskInputs')]
[switch]
$GetWorkspaceTaskInput
)

Get-PowerCode -NearestVSCodeWorkspaceObject  | 
    ForEach-Object {
        # This isn't a typo, within workspace files, tasks is an object containing a property tasks, which is a list of tasks.                 
        foreach ($vsCodeTask in $_.tasks.inputs) {
            # Either way, decorate the object.
            $vsCodeTask.pstypenames.insert(0, 'VSCode.Task.Input')
            $vsCodeTask
        }
    }