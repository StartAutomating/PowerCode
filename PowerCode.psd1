@{
    ModuleVersion = '0.1'
    RootModule    = 'PowerCode.psm1'
    Guid = '165974fc-ef0d-401d-b6c8-c3c9514ed952'
    Author = 'James Brundage'
    Copyright = '2023 Start-Automating'
    Description = 'A PowerShell Module for Customizing Visual Studio Code'
    PrivateData   = @{
        PSData    = @{
            Tags       = 'PowerShell', 'VSCode', 'VisualStudioCode'
            ProjectURI = 'https://github.com/StartAutomating/PowerCode'
            LicenseURI = 'https://github.com/StartAutomating/PowerCode/blob/main/LICENSE'
            ReleaseNotes = @'
## PowerCode 0.1:

* Initial Extensions:
  * Get-VSCode -Version (Fixes #6)
  * Set-VSCode -FontSize (Fixes #7)
* Get-VSCode (Fixes #3)
* Get-PowerCode (Fixes #4)
* Set-VSCode (Fixes #5)
* Initial Release of PowerCode (Fixes #1)

'@
        }
    }
}
