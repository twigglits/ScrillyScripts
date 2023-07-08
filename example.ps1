
# For disabling via regedit
# (HKLM:\ being the standard alias for the "Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\" registry drive path.)
# Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Name DisableWindowsUpdateAccess -Value 1


# For disabling service do
# Set-Service -Name $serviceName -StartupType Disabled