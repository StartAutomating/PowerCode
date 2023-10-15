[Include('*-*.ps1')]$PSScriptRoot

$PowerCode = $this = $MyInvocation.MyCommand.ScriptBlock.Module

$PowerCode.pstypenames.insert(0, 'PowerCode')

Export-ModuleMember -Function * -Alias * -Variable PowerCode