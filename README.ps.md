PowerCode is a PowerShell module to configure Visual Studio Code.

~~~PipeScript {
    Import-Module .\PowerCode.psd1 -Global
    Get-Command -Module PowerCode | 
        Select-Object Name, @{
            Name='Link'
            Expression={"docs/$($_.Name).md"}
        }
}
~~~