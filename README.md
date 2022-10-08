# SillyScripts
A script that allows you to debloat Windows 10 and install commonly needed apps

## Pre-requisite for script to run:

The following line MUST be run as administrator in powershell so that scripts can be run on your system:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### For removing bloatware do:

First, be sure to open Powershell with `Administrator` privileges,
Then run the following command:
```
cd ~\<Location to where you downloaded the folder>\SillyScripts 
```
Then run the run_me.sp1 script with the following command:
```
.\run_me.ps1
```
Please NOTE that `git` is mandatory for this script and must be installed to allow for full execution of the script.

#### For installing commonly used apps:

You can open and modify the file [apps_list.ps1](apps_list.ps1) and add more lines of apps that get installed:

Currently the script is set to install the following apps in unattended mode:

* spotify
* discord
* googlechrome
* steamclient
* qbittorrent
* vscode
* 7zip

To install the list of apps specified in the script, run:

```
.\add_common_apps.ps1
```

NOTES:

You can `add` or `remove` desired apps to be installed by opening [apps_list.ps1](apps_list.ps1) with a text editor
and add the line `choco install <your-desired-package-here> -y` 
 
While most of the script executes in unattended mode, you will have to specify that you would like to Disable Windows Defender near the end of the execution of this script.

Things to improve:

* Removal of third party windows defender disbaling script and replacing it with low level registry editor script that forcible removes windows defender and subsequent security background processes
* Improved modularity of both common apps as well as specific drivers that are installed in their scripts `add_common_apps.ps1` and `add_specific_drivers.ps1` respectively
