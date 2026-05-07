<#
Script to install Snagit 2026
Love Håkansson 2026-05-07
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2026.mst -OutFile c:\edrm\snagit.mst
Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit2026.msi -OutFile c:\edrm\snagit.msi

Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\snagit.msi', 'TRANSFORMS="c:\\edrm\\snagit.mst"', '/qn') -Wait
