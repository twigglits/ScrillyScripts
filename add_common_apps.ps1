Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
# Added neofetch install via scoop package manager, because it's really cool ;)
iwr -useb get.scoop.sh | iex
scoop update
scoop install sudo
scoop install gsudo
scoop install neofetch 
scoop update neofetch

# Specify the apps you want to install here:
gsudo -n -w powershell ./apps_list.ps1