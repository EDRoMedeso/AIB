<#
Script to install 7zip
Love Håkansson 2023-09-20
Updated 2024-05-17 v.24.05
Updated 2024-09-10 v.24.08
Updated 2025-01-03 v.24.09
Updated 2025-08-07 v.25.01
Updated 2026-05-07 v.26.01
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/7z2601-x64.msi -OutFile c:\edrm\7zip.msi
Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\7zip.msi', '/qn', 'INSTALLDIR="C:\\Program Files\\7-Zip"') -Wait
