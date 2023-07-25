
#windows japanese localization
$lpurl = "http://kikawadiag.blob.core.windows.net/vhds"
$lpfile ="LpTemp2019.cab"
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force


Start-BitsTransfer -Source $lpurl/$lpfile -Destination $wintemp
Add-WindowsPackage -Online -PackagePath $wintemp\$lpfile

Set-WinSystemLocale -SystemLocale ja-JP
Set-TimeZone -Id "Tokyo Standard Time"

# RunOnce
$unattendxml = $workdir + "unattend.xml"

$xml = @"
<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">
<gs:UserList>
<gs:User UserID="Current" CopySettingsToDefaultUserAcct="true" CopySettingsToSystemAcct="true"/>
</gs:UserList>
</gs:GlobalizationServices>
"@
$xml | Out-File -FilePath $unattendxml

Restart-Computer -Force

