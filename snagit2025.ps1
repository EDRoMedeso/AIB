<#
Script to install Snagit 2025
Love Håkansson 2025-08-06
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2025.mst -OutFile c:\edrm\snagit.mst
Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2025.msi -OutFile c:\edrm\snagit.msi

Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\snagit.msi', 'TRANSFORMS="c:\\edrm\\snagit.mst"', '/qn') -Wait
