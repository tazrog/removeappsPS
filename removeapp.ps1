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


