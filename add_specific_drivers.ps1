#  Installers
$files =  @("nvidia" , "LAN" , "chipset" , "AI_suite" , "bt", "sata", "audio", "wifi")   # nvidia manual download, not being used anymore, using generalized approach now

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 2

new-item -type directory -path drivers -Force

# Assigning permissions to sub folder 
$dir = "drivers\"
new-item -type directory -path $dir -Force
$Acl = Get-Acl $dir
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Users", "FullControl", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl -Path $dir -AclObject $Acl

# Chipset
$dir = "drivers\" + $files[2] + "\"  
$path = $dir + $files[2]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/MEI_Consumer_V11051189.zip -OutFile $path 
7z x $path -odrivers\chipset -y
Start-Process -FilePath 'drivers\chipset\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# AI Suite
$dir = "drivers\" + $files[3] + "\"
$path = $dir + $files[3]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/AISuite3_Win7-8-8-1_M6F_VER10056.zip -OutFile $path
7z x $path -odrivers\AI_suite -y
Start-Process -FilePath 'drivers\AI_suite\AISuite3_Win7-8-8-1_M6F_VER10056\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# BT
$dir = "drivers\" + $files[4] + "\"
$path = $dir + $files[4]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/BT/Bluetooth_V1201650_WHQL_Win10.zip -OutFile $path
7z x $path -odrivers\bt -y
Start-Process -FilePath 'drivers\bt\Bluetooth\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# SATA (Intel Rapid Storage Technology (IRST))
$dir = "drivers\" + $files[5] + "\"
$path = $dir + $files[5]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/sata/IRST_V14_5_0_1081_WHQL.zip -OutFile $path
7z x $path -odrivers\sata -y
Start-Process -FilePath 'drivers\sata\IRST_V14.5.0.1081_WHQL\Install\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru 

# Audio
$dir = "drivers\" + $files[6] + "\"
$path = $dir + $files[6]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/audio/Realtek_Audio_V7829_20160630.zip -OutFile $path
7z x $path -odrivers\audio -y
Start-Process -FilePath 'drivers\audio\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# # WIFI
$dir = "drivers\" + $files[7] + "\"
$path = $dir + $files[7]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/wireless/WIFI_Win10_V6_34_223_5.zip -OutFile $path
7z x $path -odrivers\ -y
Start-Process -FilePath 'drivers\wifi\Win10\Install_CD\Setup.exe' -ArgumentList "/S /v /qn" -passthru

# # LAN Driver 
$dir = "drivers\" + $files[1] + "\"
$path = $dir + $files[1]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip -OutFile $path
7z x $path -odrivers\LAN -y
Start-Process -FilePath 'drivers\LAN\LAN_V20.1.2019.0_WHQL\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

Read-Host -Prompt "Press any key to continue..."
