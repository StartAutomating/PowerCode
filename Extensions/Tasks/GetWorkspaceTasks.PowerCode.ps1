<#
.SYNOPSIS
    Gets VSCode workspace tasks
.DESCRIPTION
    Gets the workspace tasks from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetWorkspaceTask
.EXAMPLE
    PowerCode -GetWorkspaceTasks
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current workspace's tasks.
[Parameter(Mandatory)]
[Alias('GetWorkspaceTasks')]
[switch]
$GetWorkspaceTask
)

Get-PowerCode -NearestVSCodeWorkspaceObject  | 
    ForEach-Object {
        # This isn't a typo, within workspace files, tasks is an object containing a property tasks, which is a list of tasks.                 
        foreach ($vsCodeTask in $_.tasks.tasks) {
            # Either way, decorate the object.
            $vsCodeTask.pstypenames.insert(0, 'VSCode.Task')
            $vsCodeTask
        }
    }