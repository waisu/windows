
#windows japanese localization
$wintemp = "C:\Windows\Temp"
$lpurl = "https://mkiimage.blob.core.windows.net/vhd" 
$lpfile ="LpTemp2022.cab"
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force

Invoke-WebRequest "https://mkiimage.blob.core.windows.net/vhd/LpTemp2022.cab" -OutFile $wintemp\$lpfile
Add-WindowsPackage -Online -PackagePath $wintemp\$lpfile

Set-WinSystemLocale -SystemLocale ja-JP
Set-TimeZone -Id "Tokyo Standard Time"

Add-WindowsCapability -Online -Name 'Language.Basic~~~ja-JP~0.0.1.0' -Verbose  
Add-WindowsCapability -Online -Name 'Language.Fonts.Jpan~~~und-JPAN~0.0.1.0' -Verbose 
Add-WindowsCapability -Online -Name 'Language.OCR~~~ja-JP~0.0.1.0' -Verbose 
Add-WindowsCapability -Online -Name 'Language.Handwriting~~~ja-JP~0.0.1.0' -Verbose   # Optional 
Add-WindowsCapability -Online -Name 'Language.Speech~~~ja-JP~0.0.1.0' -Verbose        # Optional 
Add-WindowsCapability -Online -Name 'Language.TextToSpeech~~~ja-JP~0.0.1.0' -Verbose  # Optional


Set-ItemProperty "registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\00000411" -Name "Layout File" -Value "kbd106.dll"
