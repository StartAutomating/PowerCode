<#
.SYNOPSIS
    Removes tasks from VSCode
.DESCRIPTION
    Removes Visual Studio Code Tasks
#>
[ValidatePattern('^Remove-(?>Power|VS)Code')]
param(
# The name of the task to remove.
[Parameter(Mandatory)]
[SupportsWildcards()]
[Alias('RemoveTaskLabel')]
[string]
$RemoveTaskName,

# The location the task should be removed from
[ValidateSet('Project','User','Workspace')]
[string[]]
$RemoveTaskFrom
)

if (-not $RemoveTaskFrom) {
    $RemoveTaskFrom = 'Project','User','Workspace'        
}


foreach ($removeFrom in $RemoveTaskFrom) {
    $taskList = @()
    $taskPath = $null
    $taskJsonPath = ""
    switch ($removeFrom) {
        Project {
            $taskList = @(Get-PowerCode -GetProjectTask)
            if ($taskList) {
                $taskPath = ((Get-PowerCode -GetNearestVSCodeDirectory) | Join-Path -ChildPath "tasks.json")
            }
        }
        User {
            $taskList = @(Get-PowerCode -GetUserTask)
            if ($taskList) {
                $taskPath = ((Get-PowerCode -GetUserDirectory) | Join-Path -ChildPath "tasks.json" | Get-Item).FullName
            }
        }
        Workspace {
            $taskList = @(Get-PowerCode -GetWorkspaceTask)
            $taskPath = @(Get-PowerCode -NearestVSCodeWorkspaceObject).WorkspacePath
            $taskJsonPath  = "tasks"
        }
    }

    if ($taskList -and $taskPath) {
        $jsonObject = [IO.File]::ReadAllText($taskPath) | ConvertFrom-Json
        $targetObject = $jsonObject
        if ($taskJsonPath) {
            foreach ($dotPath in $taskJsonPath -split '\.') {
                $targetObject = $targetObject.$dotPath
            }
            if (-not $targetObject) { continue }
        }

        foreach ($taskObject in $taskList) {
            if (($taskObject.label -like $RemoveTaskName) -and 
                $PSCmdlet.ShouldProcess("Remove Task $($taskObject.Name) from $TaskPath")) {
                $targetObject.tasks = @($targetObject.tasks | Where-Object Label -NotLike $RemoveTaskName)
                ConvertTo-Json $jsonObject -Depth 100 | Set-Content -Path $taskPath
            }
        }
    }
}

