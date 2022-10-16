Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
# Added neofetch install via scoop package manager, because it's really cool ;)
Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
scoop update
scoop install sudo
scoop install gsudo

# Specify the apps you want to install here:
gsudo -n -w powershell ./apps_list.ps1