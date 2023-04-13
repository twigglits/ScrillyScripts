Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


choco install nodejs -y
choco install python3 -y
choco install parsec -y
choco install openrgb -y
choco install telegram -y
choco install windirstat -y
choco install XAMPP-81 -y
choco install obs-studio -y
choco install nvidia-display-driver -y
choco install spotify -y 
choco install discord -y
choco install googlechrome -y
choco install steam -y
choco install qbittorrent -y
choco install vlc -y
choco install vscode -y
choco install 7zip -y
choco upgrade all -y