PowerCode is a PowerShell module to configure Visual Studio Code.

## Commands

~~~PipeScript {
    Import-Module .\PowerCode.psd1 -Global
    @{
        Table =
            Get-Command -Module PowerCode | 
            Select-Object Name, @{
                Name='Link'
                Expression={"docs/$($_.Name).md"}
            }
    }    
}
~~~