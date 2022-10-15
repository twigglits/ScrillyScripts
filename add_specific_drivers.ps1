# Function setup
$folders = @()  # Intialization of empty array

# Installers
$files =  @("nvidia.exe" , "LAN.zip" , "chipset.zip")   # rename this to installers   name of compressed folders..., vs names of actual extracted installers

foreach ($file in $files)
{
    $folders += $file.split(".")[0] # split here into string
}
# First folder is:
Write-Output $folders[0]
# # Second folder is:
Write-Output $folders[1]
# # Third folder is:
Write-Output $folders[2]

# Nvidia Driver
$dir = "drivers\" + $folders[0] + "\"
$path = $dir + $files[0]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe -OutFile $path
Start-Process -FilePath $path -ArgumentList "/S /v /qn" -passthru

# LAN Driver 
$dir = "drivers\" + $folders[1] + "\"
$path = $dir + $files[1]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip -OutFile $path
7z x $path -y
Move-Item 'LAN_V20.1.2019.0_WHQL' 'drivers\LAN\'
### Else run file directly 
Start-Process -FilePath 'drivers\LAN\LAN_V20.1.2019.0_WHQL\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# Chipset
# $dir = "drivers\" + $folders[2] + "\"
# $path = $dir + $files[2]
# new-item -type directory -path $dir -Force
# Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/MEI_Consumer_V11051189.zip -OutFile $path # truncate get zip, exe away and just leave path
# 7z x $files[2] -y
# # Move-Item <folder name here>\ drivers\$files[2]