# Modifying system permissions
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-ExecutionPolicy RemoteSigned
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 2


# Add common apps
.\apps_list.ps1
# Add specific drivers from specific sources (This is unique for each user and you should not use the defaults set `add_specific_drivers.ps1`)
.\add_specific_drivers.ps1
# Disable windows mouse "precision" drivers
.\disable_mouse_epp.ps1
# Debloat windows defender
.\debloat.ps1 -y
# Disable windows defender
.\disable_defender.ps1