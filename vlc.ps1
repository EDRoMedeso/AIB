<#
Script to install VLC Media Player
Love Håkansson 2023-11-04, 2024-09-10
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/vlc-3.0.21-win64.exe -OutFile c:\edrm\vlc-3.0.21-win64.exe
Start-Process -FilePath c:\edrm\vlc-3.0.21-win64.exe -ArgumentList @('/L=1033', '/S') -Wait
