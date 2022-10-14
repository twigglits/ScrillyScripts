# Balena Etcher
# 7z x drivers.7z -y
# start-sleep -Seconds 5
# $balena="drivers\balenaEtcher-Setup-1.7.9.exe"
# Start-Process -FilePath $balena -ArgumentList "/S /v /qn" -passthru

$files = "nvidia.exe" , "LAN" 

# Nvidia Driver
Invoke-WebRequest -O $files[0] https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe
Move-Item $files[0] drivers\$files[0]
$nvidia = "drivers\"+$files[0]
Write-Output $nvidia
Start-Process -FilePath $nvidia -ArgumentList "/S /v /qn" -passthru

# LAN driver
Invoke-WebRequest -O LAN.zip https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip
7z x LAN.zip -y 
Move-Item LAN_V20.1.2019.0_WHQL\ drivers\$files[1]
$LAN = "drivers\"+ $files[1] + "\AsusSetup.exe"
Write-Output $LAN
Start-Process -FilePath $LAN -ArgumentList "/S /v /qn" -passthru