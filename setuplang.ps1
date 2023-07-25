Set-WinHomeLocation -GeoId 122
Set-WinUserLanguageList -LanguageList ja-JP -Force
Set-WinUILanguageOverride -Language ja-JP
Set-WinCultureFromLanguageListOptOut -OptOut 0
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"
Set-ItemProperty "registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" -Name "LayerDriver JPN" -Value "kbd106.dll"
control.exe "intl.cpl,,/f:```"$unattendxml```""
Set-ItemProperty -Path "$autologonreg" -Name "AutoAdminLogon" -Value "0"
Set-ItemProperty -Path "$autologonreg" -Name "DefaultUserName" -Value ""
Set-ItemProperty -Path "$autologonreg" -Name "DefaultPassword" -Value ""
Restart-Computer -Force


