<#
.SYNOPSIS
    Gets VSCode project tasks
.DESCRIPTION
    Gets the user tasks from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetProjectTaskInputs
.EXAMPLE
    PowerCode -GetProjectTaskInput
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current project's task inputs.
[Parameter(Mandatory)]
[Alias('GetProjectTaskInputs')]
[switch]
$GetProjectTaskInput
)

Get-PowerCode -NearestVSCodeDirectory | 
    ForEach-Object {
        $foundDirectory =  $_
        $tasksPath = $foundDirectory | Join-Path -ChildPath "tasks.json"
        if (Test-Path $tasksPath) {
            Get-Content -Path $tasksPath -raw | 
            ConvertFrom-Json |
            ForEach-Object {
                foreach ($vsCodeTask in $_.inputs) {
                    $vsCodeTask.pstypenames.insert(0, 'VSCode.Task.Input')
                    $vsCodeTask
                }
            }
        }
    }

