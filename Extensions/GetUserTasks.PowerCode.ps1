<#
.SYNOPSIS
    Gets VSCode user tasks
.DESCRIPTION
    Gets the user tasks from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetUserTasks
.EXAMPLE
    PowerCode -GetUserTask
#>
[Management.Automation.Cmdlet("(?:Get){0,1}","(?>Power|VS)Code")]
param(
# If set, will get the current user's tasks.
[Parameter(Mandatory)]
[Alias('GetUserTasks')]
[switch]
$GetUserTask
)


PowerCode -GetUserDirectory |
    Get-ChildItem -Filter tasks.json |
    & { process {
        [IO.File]::ReadAllText($_.Fullname) | 
        ConvertFrom-Json |
        ForEach-Object {
            foreach ($vsCodeTask in $_.tasks) {
                $vsCodeTask.pstypenames.insert(0, 'VSCode.Task')
                $vsCodeTask
            }
        }
    } }