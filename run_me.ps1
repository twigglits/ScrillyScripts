Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install git -y
choco upgrade all
.\git_script.sh
cd Windows10Debloater
.\Windows10SysPrepDebloater.ps1 -y
cd ..
.\Disable_Windows_Defender_on_Windows_10.bat -y