
#windows japanese localization
$wintemp = "C:\Windows\Temp"
$lpurl = "http://kikawadiag.blob.core.windows.net/vhds"
$lpfile ="LpTemp2016.cab"
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force


Start-BitsTransfer -Source $lpurl/$lpfile -Destination $wintemp
Add-WindowsPackage -Online -PackagePath $wintemp\$lpfile

Set-WinSystemLocale -SystemLocale ja-JP
Set-TimeZone -Id "Tokyo Standard Time"


Restart-Computer -Force

