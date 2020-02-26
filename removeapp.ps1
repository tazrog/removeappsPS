# Privacy Script for Windows 10 in PowerShell
# Written by R Scharmen

# Remove unwanted Apps
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *stickynotes* | Remove-AppxPackage
Get-AppxPackage *gethelp* | Remove-AppxPackage
Get-AppxPackage *messaging* | Remove-AppxPackage
Get-AppxPackage *your phone* | Remove-AppxPackage



#Set Registry
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$Name = "AllowTelemetry"
$value = "0"
if (!(Test-Path -Path $registryPath)){
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType "Dword"
}
else { 
    Set-ItemProperty -Path $registryPath -Name $name -Value $value
     }
    
Set-ItemProperty -Path $registryPath -Name $name -Value $value 
Get-ItemProperty -Path $registryPath -Name AllowTelemetry

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
$Name = "AllowCortana"
$value = "0"

if (!(Test-Path -Path $registryPath)){
    mkdir "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
    New-ItemProperty -Path $registryPath  -Name $name -Value $value -PropertyType "Dword"
    
}
else { 
    Set-ItemProperty -Path $registryPath -Name $name -Value $value
     }

Get-ItemProperty -Path $registryPath -Name AllowCortana

#Change ConnectedUserExperiance in Services
Set-Service -Name "DiagTrack" -StartupType Disabled
Get-Service DiagTrack | Select-Object Name, StartType, Status



# SIG # Begin signature block
# MIIFdgYJKoZIhvcNAQcCoIIFZzCCBWMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUOGwRAWJR6bqAekKB6mdY525S
# URCgggMOMIIDCjCCAfKgAwIBAgIQKYeH3thViK9Kho+7lakYkzANBgkqhkiG9w0B
# AQUFADAdMRswGQYDVQQDDBJMb2NhbCBDb2RlIFNpZ25pbmcwHhcNMjAwMjI2MjA0
# NjMzWhcNMjEwMjI2MjEwNjMzWjAdMRswGQYDVQQDDBJMb2NhbCBDb2RlIFNpZ25p
# bmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDbai52D2hIBRK+gDKX
# FJLxI8HHCfu5Fdv5gwQI0wPJaVq4JLAZYAi3fmnopdJYnfR0UoTyBGqnMe/xO9de
# 1ZvLAsbYl419pwVbGFIi2fAzN2m4uDAohZC5QTkA65QIVE6btECBAyCKvLPt6boU
# D2D4A2taF22e0hjgOqOCjYS9uP7GX6UcgvjW/duosmjbOjstikyjrN/LTOhGPAzM
# KyjhYyxwECoQCYR8G/ZGrQiAeZNNigF0GonUr6LVfJ37QN/QmSj2J+Sy1RDJIfmg
# 7hPFUOkeCwywIvWilta5mYC8EHfYuGUUgS81+QqrEQyxs7V/V/ENOVobvdDFYTss
# vMC1AgMBAAGjRjBEMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcD
# AzAdBgNVHQ4EFgQUHc7vOzLEHJJRmWKH8ttNFWPlESkwDQYJKoZIhvcNAQEFBQAD
# ggEBAEzx84L6FtzyMqCREGQuXzwFQIIgF+8vsKJgwo+HHuncU0NvjuTjT4KJIhjR
# VTY8ky2zQSxosawKoEXTbwIXHw9wRukiyUkjn9vqHPMcNQp6CorFq8MnIlZXz4Eb
# Q4N7fV0tOADJvxq+BlJ0jinlKja/kmN9kieIzeh+oaGDFUmsrTg0vU0am2jFdWXY
# QpVwWT3DpbAKP93IBkXWqQxB3L+0n5hO2TuN2dLJ0Vfmx7VpkFxx6mJby4U8OCGL
# wC9TklOYIbN6r5brmcbZDD4ACrpA+Qqo+eoKGCqMQnabkUlpgAc30xNXqLyDfhtb
# +wPcSTWTCPs1rxvLZOj7XzHGDWoxggHSMIIBzgIBATAxMB0xGzAZBgNVBAMMEkxv
# Y2FsIENvZGUgU2lnbmluZwIQKYeH3thViK9Kho+7lakYkzAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUl/3rJielYzTwfUii4dXFE4oAHOQwDQYJKoZIhvcNAQEBBQAEggEAdDQtLGST
# wr7OJehNc4RQU4emkoMh8X4rqEukgSP2uk7hTXzyMPPLiDZdpwLf9w13BREh7iS9
# u8Wl4T7IxmUdheehq5oTXZa/j4qmTtwbaOJKsrniNhKLHmxKq+3rZkAEhEETi8LD
# aeiJ+hyUnrnM2P+8Jt47N87WPHzBViPmTjYgigZJwItqd4IKV3H12S7YuEbZGMnv
# mr1OM0mQd7p0ODz/MWjL396fAjC2tLS6o6BsaPyukW/84P+b4D24KQEHqUWPspe6
# aL5/Lgid2bAefqyxMftIdR/kztXtKBZBGdFMeXpqHLwlnMTyv+QwFA2T5tJRmySh
# VX///+ulDqXQ0w==
# SIG # End signature block
