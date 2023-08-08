$workdir = "D:\"
$unattendxml = $workdir + "unattend.xml"

$xml = @"
<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">
<gs:UserList>
<gs:User UserID="Current" CopySettingsToDefaultUserAcct="true" CopySettingsToSystemAcct="true"/>
</gs:UserList>
</gs:GlobalizationServices>
"@
$xml | Out-File -FilePath $unattendxml

Set-WinSystemLocale -SystemLocale ja-JP
Set-TimeZone -Id "Tokyo Standard Time"

Set-WinHomeLocation -GeoId 122
Set-WinUserLanguageList -LanguageList ja-JP -Force
Set-WinUILanguageOverride -Language ja-JP
Set-WinCultureFromLanguageListOptOut -OptOut 0
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"
Set-ItemProperty "registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" -Name "LayerDriver JPN" -Value "kbd106.dll"
Set-ItemProperty "registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\00000411" -Name "Layout File" -Value "kbd106.dll"

control.exe "intl.cpl,,/f:```"$unattendxml```""
