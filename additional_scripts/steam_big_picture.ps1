$ConnectedMonitors = Get-PnpDevice | `
    Where-Object {$_.FriendlyName -eq "Xbox One Wireless Controller"} | `
    Where-Object {$_.status -eq "OK"}

if (@($ConnectedMonitors) -like "*Xbox*"){
    Write-host "launching Big Picture.."
    Start-Process -FilePath "MultiMonitorTool.exe" -ArgumentList "/disable 1 /enable 2"
    Start-Sleep -s 2
    Set-AudioDevice -ID "{0.0.0.00000000}.{f35a2713-d173-444e-a0d2-f4e8c59c7a14}"
    Start-Process -FilePath "C:\Program Files (x86)\Steam\steam.exe" -ArgumentList "steam://open/bigpicture"
}
else {
    Set-AudioDevice -ID "{0.0.0.00000000}.{48b7cd89-4302-412b-bbbf-8117741b339b}"
    Start-Process -FilePath "MultiMonitorTool.exe" -ArgumentList "/disable 2 /enable 1"
}