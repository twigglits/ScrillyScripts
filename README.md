# SillyScripts
A script that allows you to debloat Windows 10 and install commonly needed apps

## Instructions:

First, be sure to open Powershell with Administrator privileges,
Then run the following command:
```
cd ~\<Location to where you downloaded the folder>\ScrillyScripts 
```
Then run the run_me.sp1 script with the following command:
```
.\run_me.sp1
```

NOTES:

You can add/remove desired apps to be installed by opening run_me.sp1 with a text editor
and the line ```choco install <your-desired-package-here> -y``` .Please NOTE that git is 
mandatory for this script and must be installed to allow for full execution of the script.
 
While most of the script executes in unattended mode, you will have to 
specify that you would like to Disable Windows Defender near the end of the execution of 
this script.
