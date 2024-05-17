<#
Script to install 7zip
Love Håkansson 2023-09-20
Updated 2024-05-17 v.24.05
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/7z2405-x64.msi -OutFile c:\edrm\7zip.msi
Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\7zip.msi', '/qn', 'INSTALLDIR="C:\\Program Files\\7-Zip"') -Wait
