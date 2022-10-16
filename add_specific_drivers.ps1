# Function setup
# $folders = @()  # Intialization of empty array

#  Installers
$files =  @("nvidia" , "LAN" , "chipset" , "AI_suite" , "bt", "sata", "audio", "wifi")   # rename this to installers   name of compressed folders..., vs names of actual extracted installers

# foreach ($file in $files)
# {
#     $folders += $file.split(".")[0] # remove file extension here from the name (e.g. .exe , .zip)
# }


# # Nvidia Driver
$dir = "drivers\" + $files[0] + "\"
$path = $dir + $files[0]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe -OutFile drivers\nvidia\nvidia.exe
Start-Process -FilePath 'drivers\nvidia\nvidia.exe' -ArgumentList "/S /v /qn" -passthru

# LAN Driver 
$dir = "drivers\" + $files[1] + "\"
$path = $dir + $files[1]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip -OutFile $path
7z e $path -odrivers\LAN -y
Start-Process -FilePath 'drivers\LAN\LAN_V20.1.2019.0_WHQL\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# Chipset
$dir = "drivers\" + $files[2] + "\"  #folder doesn't have \ sign so then...
$path = $dir + $files[2]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/MEI_Consumer_V11051189.zip -OutFile $path # truncate get zip, exe away and just leave path
7z e $path -odrivers\chipset -y
Start-Process -FilePath 'drivers\chipset\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# # AI Suite
$dir = "drivers\" + $files[3] + "\"
$path = $dir + $files[3]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/AISuite3_Win7-8-8-1_M6F_VER10056.zip -OutFile $path
7z e $path -odrivers\AI_suite -y
Start-Process -FilePath 'drivers\AI_suite\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# BT
$dir = "drivers\" + $files[4] + "\"
$path = $dir + $files[4]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/BT/Bluetooth_V1201650_WHQL_Win10.zip -OutFile $path
7z e $path -odrivers\bt -y
Start-Process -FilePath 'drivers\bt\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# SATA (Intel Rapid Storage Technology (IRST))
$dir = "drivers\" + $files[5] + "\"
$path = $dir + $files[5]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/sata/IRST_V14_5_0_1081_WHQL.zip -OutFile $path
7z e $path -odrivers\sata -y
Start-Process -FilePath 'drivers\sata\AsusSetup.exe' -ArgumentList "/S /v /qn" -NoNewWindow -Wait -passthru $process.ExitCode
Start-Process -FilePath 'drivers\sata\AsusSetup.exe' -ArgumentList '/S','/v','/qn' -Wait -passthru # -NoNewWindow -Wait -passthru $process.ExitCode

# Audio
$dir = "drivers\" + $files[6] + "\"
$path = $dir + $files[6]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/audio/Realtek_Audio_V7829_20160630.zip -OutFile $path
7z e $path -odrivers\audio -y
Start-Process -FilePath 'drivers\audio\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# WIFI
$dir = "drivers\" + $files[7] + "\"
$path = $dir + $files[7]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/wireless/WIFI_Win10_V6_34_223_5.zip -OutFile $path
7z e $path -odrivers\wifi -y
Start-Process -FilePath 'drivers\wifi\Setup.exe' -ArgumentList "/S /v /qn" -NoNewWindow -Wait -passthru $process.ExitCode

# # '/S', '/v', '/qn'
# # '/S','/v"/qn"'
# # -NoNewWindow -Wait -PassThru $process.ExitCode
# # Setup.exe /?  /help
# # /exebasicui
