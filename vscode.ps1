<#
Script to install VS Code
Love Håkansson 2023-10-10, 2024-01-20, 2024-09-10, 2025-01-03, 2025-08-07
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/VSCodeSetup-x64-1.102.3.exe -OutFile c:\edrm\VSCodeSetup-x64-1.102.3.exe
Start-Process -FilePath c:\edrm\VSCodeSetup-x64-1.102.3.exe -ArgumentList @('/SP-', '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/MERGETASKS=!runcode') -Wait
