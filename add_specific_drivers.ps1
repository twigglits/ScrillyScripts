# Balena Etcher
7z x drivers.7z -y
start-sleep -Seconds 5
$balena="drivers\balenaEtcher-Setup-1.7.9.exe"
Start-Process -FilePath $balena -ArgumentList "/S /v /qn" -passthru

# Nvidia Driver
Invoke-WebRequest -O nvidia_installer.exe https://us.download.nvidia.com/Windows/517.48/517.48-desktop-win10-win11-64bit-international-dch-whql.exe
Move-Item nvidia_installer.exe drivers\nvidia_installer.exe
$nvidia = "drivers\nvidia_installer.exe"
Start-Process -FilePath $nvidia -ArgumentList "/S /v /qn" -passthru