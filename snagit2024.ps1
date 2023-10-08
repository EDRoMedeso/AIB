<#
Script to install Snagit 2024
Love Håkansson 2023-10-08
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2024.mst -OutFile c:\edrm\snagit.mst
Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2024.msi -OutFile c:\edrm\snagit.msi

Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\snagit.msi', 'TRANSFORMS="c:\\edrm\\snagit.mst"', '/qn') -Wait
