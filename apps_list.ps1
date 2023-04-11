Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install nvidia-display-driver -y
choco install spotify -y 
choco install discord -y
choco install googlechrome -y
choco install steam-client -y
choco install qbittorrent -y
choco install vlc -y
choco install vscode -y
choco install 7zip -y
choco upgrade all -y