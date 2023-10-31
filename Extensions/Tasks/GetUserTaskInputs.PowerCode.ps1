<#
.SYNOPSIS
    Gets VSCode user task inputs
.DESCRIPTION
    Gets the user tasks from Visual Studio Code
.EXAMPLE
    Get-PowerCode -GetUserTaskInputs
.EXAMPLE
    PowerCode -GetUserTaskInput
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get the current user task inputs.
[Parameter(Mandatory)]
[Alias('GetUserTaskInputs')]
[switch]
$GetUserTaskInput
)


PowerCode -GetUserDirectory |
    Get-ChildItem -Filter tasks.json |
    & { process {
        [IO.File]::ReadAllText($_.Fullname) | 
        ConvertFrom-Json |
        ForEach-Object {
            foreach ($vsCodeTask in $_.inputs) {
                $vsCodeTask.pstypenames.insert(0, 'VSCode.Task.Input')
                $vsCodeTask
            }
        }
    } }