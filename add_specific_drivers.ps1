# Function setup
$folders = @()  # Intialization of empty array

#  Installers
$files =  @("nvidia.exe" , "LAN.zip" , "chipset.zip" , "AI_suite.zip")   # rename this to installers   name of compressed folders..., vs names of actual extracted installers

foreach ($file in $files)
{
    $folders += $file.split(".")[0] # # split here into string
}
# # First folder is:
Write-Output $folders[0]
# # Second folder is:
Write-Output $folders[1]
# # Third folder is:
Write-Output $folders[2]
# # Fourth folder is:
Write-Output $folders[3]

# # Nvidia Driver
$dir = "drivers\" + $folders[0] + "\"
$path = $dir + $files[0]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe -OutFile $path
Start-Process -FilePath $path -ArgumentList "/S /v /qn" -passthru

# # LAN Driver 
$dir = "drivers\" + $folders[1] + "\"
$path = $dir + $files[1]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/lan/LAN_V20_1_2019_0_WHQL.zip -OutFile $path
# # extract archive and move into respective sub folder:
7z e $path -odrivers\LAN -y
Start-Process -FilePath 'drivers\LAN\LAN_V20.1.2019.0_WHQL\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# # Chipset
$dir = "drivers\" + $folders[2] + "\"  #folder doesn't have \ sign so then...
$path = $dir + $files[2]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/MEI_Consumer_V11051189.zip -OutFile $path # truncate get zip, exe away and just leave path
7z e $path -odrivers\chipset -y
Start-Process -FilePath 'drivers\chipset\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# # AI Suite
$dir = "drivers\" + $folders[3] + "\"
$path = $dir + $files[3]
new-item -type directory -path $dir -Force
Invoke-WebRequest https://dlcdnets.asus.com/pub/ASUS/misc/utils/AISuite3_Win7-8-8-1_M6F_VER10056.zip -OutFile $path
7z e $path -odrivers\AI_suite -y
Start-Process -FilePath 'drivers\AI_suite\AsusSetup.exe' -ArgumentList "/S /v /qn" -passthru

# '/S', '/v', '/qn'
# '/S','/v"/qn"'
# -NoNewWindow -Wait -PassThru $process.ExitCode
# Setup.exe /?  /help
# /exebasicui
