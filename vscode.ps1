<#
Script to install VS Code
Love Håkansson 2023-10-10, 2024-01-20
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/VSCodeSetup-x64-1.85.2.exe -OutFile c:\edrm\VSCodeSetup-x64-1.85.2.exe
Start-Process -FilePath c:\edrm\VSCodeSetup-x64-1.85.2.exe -ArgumentList @('/SP-', '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/MERGETASKS=!runcode') -Wait
