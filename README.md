# SillyScripts
A script that allows you to debloat Windows 10 and install commonly needed apps

## Pre-requisite for script to run:

The following line MUST be run as administrator in powershell so that scripts can be run on your system:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### 1.) For removing bloatware do:

First, be sure to open Powershell with `Administrator` privileges,
Then run the following command:
```
cd ~\<Location to where you downloaded the folder>\SillyScripts 
```
Then execute the script with the following command:
```
.\debloat.ps1
```
Please NOTE that `git` is also installed in the execution of this script, it is a prerequisite for debloating the Windows 10

#### 2.) For disabling Defender do:

```
.\disable_defender.ps1
```

#### 3.) For installing commonly used apps:

You can `add` or `remove` desired apps to be installed by opening [apps_list.ps1](apps_list.ps1) with a text editor
and add the line `choco install <your-desired-package-here> -y` 

You can open and modify the file [apps_list.ps1](apps_list.ps1) and add/remove which apps get installed

Currently the script is set to install the following apps in unattended mode:

* spotify 
* discord 
* googlechrome 
* steam-client 
* qbittorrent 
* vlc
* vscode 
* 7zip 

To install the list of apps specified in the script, run:

```
.\add_common_apps.ps1
```

#### 4.) For installing specific drivers do:

Put your driver sources in the file [add_specific_drivers.ps1](add_specific_drivers.ps1). At the moment only the `Asus VI formula Extreme` Motherboard is supported
and is already specified in the file by default, as well as the `GTX 970 Nvidia GPU`
```
.\add_specific_drivers.ps1
```

#### 5.) Disabling windows `enhanced pointer precision` (ideal for gamers) do:
```
.\disable_mouse_epp.ps1
```

#### 6.) For running all of the scripts end-to-end simply run:
```
.\e2e.ps1
```

#### Notes:
 
While most of the script executes in unattended mode, you will have to specify that you would like to Disable Windows Defender near the end of the execution of this script

#### Things to improve:

* Removal of third party windows defender disabling script and replacing it with low level registry editor script that forcible removes windows defender and subsequent security background processes
* Migrating away from Chocolatey's package manager to use `winget` which should integrate better because it's native to windows 10. 