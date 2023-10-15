<div align='center'>
<img src='Assets/PowerCode.svg' alt='PowerCode' />
<br/>
<a href='https://github.com/sponsors/StartAutomating'>❤️</a>
<a href='https://github.com/StartAutomating/PowerCode/stargazers'>⭐</a>
</div>

## What is PowerCode?

PowerCode is a PowerShell module that you configure and automate Visual Studio code with PowerShell.

Like Visual Studio Code, PowerCode is cross-platform.

To use it, simply `Install-Module PowerCode` in your environment.

## Examples

### Getting Installed Extensions

~~~PowerShell
# Get a list of extensions
Get-PowerCode -ListExtension 
~~~

### Installing an extension

~~~PowerShell
Install-PowerCode -ExtensionID ms-dotnettools.csharp
~~~

### Changing the font size

~~~PowerShell
# Sets the font size to 18
Set-PowerCode -SetFontSize 18 
~~~

#### Changing the font size for Markdown preview

~~~PowerShell
# Sets the font size to 14 in the markdown preview
Set-PowerCode -SetFontSize 14 -SetFontSizeIn markdown
~~~

## Changing the font family

~~~PowerShell
# Sets the font family to Consolas
Set-PowerCode -SetFontFamily "Consolas"
~~~

#### Changing the font size for Markdown preview

~~~PowerShell
# Sets the font family to 'Arial' in the markdown preview
Set-PowerCode -SetFontFamily 'Arial' -setfontfamilyin markdown
~~~

## Commands

~~~PipeScript {
    Import-Module .\PowerCode.psd1 -Global
    [PSCustomObject]@{
        Table =
            Get-Command -Module PowerCode | 
            Select-Object Name, @{
                Name='Link'
                Expression={"docs/$($_.Name).md"}
            }
    }    
}
~~~