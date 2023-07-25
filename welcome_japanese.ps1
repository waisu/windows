$path = "C:\MKI\Country.xml"
New-item $path -ItemType File -Force -ErrorAction SilentlyContinue
Set-content $path '<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">
<!--User List-->
<gs:UserList>
<gs:User UserID="Current" CopySettingsToSystemAcct="true" CopySettingsToDefaultUserAcct="true" />
</gs:UserList>
</gs:GlobalizationServices>'
Start-Process -FilePath 'control.exe' -ArgumentList ('intl.cpl,,/f:"C:\MKI\Country.xml')
Start-Sleep 5
