$balena="drivers\balenaEtcher-Setup-1.7.9.exe"
Start-Process -FilePath $balena -ArgumentList "/S /v /qn" -passthru