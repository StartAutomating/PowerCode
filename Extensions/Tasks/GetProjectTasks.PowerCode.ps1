<#
.SYNOPSIS
    Gets VSCode project tasks
.DESCRIPTION
    Gets the user tasks from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetProjectTask
.EXAMPLE
    PowerCode -GetProjectTask
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current projects's tasks.
[Parameter(Mandatory)]
[Alias('GetProjectTasks')]
[switch]
$GetProjectTask
)

Get-PowerCode -GetVSCodeDirectory | 
    ForEach-Object {
        $foundDirectory =  $_
        $tasksPath = $foundDirectory | Join-Path -ChildPath "tasks.json"
        if (Test-Path $tasksPath) {
            Get-Content -Path $tasksPath -raw | 
            ConvertFrom-Json |
            ForEach-Object {
                foreach ($vsCodeTask in $_.tasks) {
                    $vsCodeTask.pstypenames.insert(0, 'VSCode.Task')
                    $vsCodeTask
                }
            }
        }
    }

