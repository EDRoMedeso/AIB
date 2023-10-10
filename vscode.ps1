<#
Script to install VS Code
Love Håkansson 2023-10-10
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/VSCodeSetup-x64-1.83.0.exe -OutFile c:\edrm\VSCodeSetup-x64-1.83.0.exe
Start-Process -FilePath c:\edrm\VSCodeSetup-x64-1.83.0.exe -ArgumentList @('/SP-', '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/MERGETASKS=!runcode') -Wait
