# Balena Etcher
# 7z x drivers.7z -y
# start-sleep -Seconds 5
# $balena="drivers\balenaEtcher-Setup-1.7.9.exe"
# Start-Process -FilePath $balena -ArgumentList "/S /v /qn" -passthru

# Function setup
$folders = @()  # Intialization of empty array

# Installers
$files =  @("nvidia.exe" , "LAN.zip" , "chipset.zip")   # rename this to installers

foreach ($file in $files)
{
    $folders += $file.split(".")[0] # split here into string
}
# First folder is:
Write-Output $folders[0]
# Second folder is:
Write-Output $folders[1]
# Third folder is:
Write-Output $folders[2]

# Nvidia Driver
# Invoke-WebRequest -O $files[0] https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe
# Move-Item $files[0] drivers\$files[0]
# $nvidia = "drivers\"+$files[0]
# Write-Output $nvidia
# Start-Process -FilePath $nvidia -ArgumentList "/S /v /qn" -passthru

# # LAN driver
# Invoke-WebRequest -O $files[1] https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip
# 7z x $files[1] -y    # if has .zip at the end then do extraction step..... future improvements
# Move-Item LAN_V20.1.2019.0_WHQL\ drivers\$files[1]
# $LAN = "drivers\"+ $files[1] + "\AsusSetup.exe"
# Write-Output $LAN
# Start-Process -FilePath $LAN -ArgumentList "/S /v /qn" -passthru

# Chipset
# Invoke-WebRequest -O $files[2] https://dlcdnets.asus.com/pub/ASUS/misc/utils/MEI_Consumer_V11051189.zip   # truncate get zip, exe away and just leave path
# 7z x $files[2] -ochipset -y 
# Move-Item <folder name here>\ drivers\$files[2]