:ToIncludeFiles foreach ($file in (Get-ChildItem -Path "$PSScriptRoot" -Filter "*-*.ps1" -Recurse)) {
    if ($file.Extension -ne '.ps1')      { continue }  # Skip if the extension is not .ps1
    foreach ($exclusion in '\.[^\.]+\.ps1$') {
        if (-not $exclusion) { continue }
        if ($file.Name -match $exclusion) {
            continue ToIncludeFiles  # Skip excluded files
        }
    }     
    . $file.FullName
}

$PowerCode = $this = $MyInvocation.MyCommand.ScriptBlock.Module

$PowerCode.pstypenames.insert(0, 'PowerCode')

Export-ModuleMember -Function * -Alias * -Variable PowerCode
