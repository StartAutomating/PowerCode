#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)

Import-BuildStep -ModuleName PowerCode

New-GitHubWorkflow -Name "PowerCode Build Workflow" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, 
    TestPowerShellOnLinux, 
    TagReleaseAndPublish, 
    BuildPowerCode -OutputPath .\.github\workflows\BuildPowerCode.yml

Pop-Location