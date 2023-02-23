#requires -Module PSDevOps
Push-Location $PSScriptRoot

Import-BuildStep -ModuleName PowerCode

New-GitHubWorkflow -Name "PowerCode Build Workflow" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, 
    TestPowerShellOnLinux, 
    TagReleaseAndPublish, 
    BuildPowerCode -OutputPath .\.github\workflows\BuildPowerCode.yml

Pop-Location