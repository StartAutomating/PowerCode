<#
.SYNOPSIS
    Gets the nearest VSCode workspace 
.DESCRIPTION
    Gets the nearest VSCode mutli-root workspace file or object
.EXAMPLE
    Get-PowerCode -NearestWorkspaceFile
.EXAMPLE
    PowerCode -NearestWorkspaceFiles
.EXAMPLE
    PowerCode -NearestWorkspaceObject   
#>
[ValidatePattern('^(?:Get-)?(?>Power|VS)Code')]
param(
# If set, will get code-workspace files in the nearest directory containing them.
[Parameter(Mandatory,ParameterSetName='NearestVSCodeWorkspace')]
[Alias('NearestWorkspaceFile','NearestWorkspaceFiles','NearestVSCodeWorkspaceFiles')]
[switch]
$NearestVSCodeWorkspaceFile,

# If set, will get the nearest code workspace objects.
[Parameter(Mandatory,ParameterSetName='NearestVSCodeWorkspaceObjects')]
[Alias('NearestWorkspaceObject','NearestWorkspaceObjects','NearestVSCodeWorkspaceObjects')]
[switch]
$NearestVSCodeWorkspaceObject
)

switch ($PSCmdlet.ParameterSetName) {
    NearestVSCodeWorkspace {
        $currentLocation = $pwd
        $foundWorkspaces = $null
        do {
            $foundWorkspaces = @(Get-ChildItem $currentLocation -Filter "*.code-workspace" -File)
            if ($foundWorkspaces) {                
                break
            }
            $currentLocation = $currentLocation | Split-Path
        } while ($currentLocation)
        
        
        if ($foundWorkspaces) {
            return $foundWorkspaces
        }
    }    
    NearestVSCodeWorkspaceObjects {
        & $MyInvocation.MyCommand.ScriptBlock -NearestVSCodeWorkspaceFile |
            & { process {
                $file = $_
                $fromJson = [IO.File]::ReadAllText($_.Fullname) | ConvertFrom-Json
                $fromJson.pstypenames.insert(0,'VSCode.Workspace')
                $fromJson.psobject.properties.add([psnoteproperty]::new("WorkspacePath", $file.Fullname))
                $fromJson
            } }
    }
}

