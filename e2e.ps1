Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Add common apps
.\add_common_apps.ps1
# Add specific drivers from specific sources (This is unique for each user and you should not use the defaults set `add_specific_drivers.ps1`)
.\add_specific_drivers.ps1
# Disable windows mouse "precision" drivers
.\disable_mouse_epp.ps1
# Debloat windows 10
.\debloat.ps1
# Disable windows defender
.\disable_defender.ps1